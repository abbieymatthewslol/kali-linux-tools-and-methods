#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_NAME="$(basename "$0")"
START_TS="$(date -u +%Y%m%dT%H%M%SZ)"
HOST_NAME="$(hostname 2>/dev/null || echo "unknown-host")"
DEFAULT_OUTPUT_DIR="${PWD}/artifacts/incident_triage_starter_${HOST_NAME}_${START_TS}"
OUTPUT_DIR="${DEFAULT_OUTPUT_DIR}"
AUTH_LINES=300
JOURNAL_WINDOW="12 hours"
DRY_RUN=false

TOTAL_COMMANDS=0
SUCCESSFUL_COMMANDS=0
FAILED_COMMANDS=0
SKIPPED_COMMANDS=0

print_usage() {
  cat <<EOF
Usage: ${SCRIPT_NAME} [OPTIONS]

Collect first-response host artifacts for Kali/Linux incident triage.

Options:
  --output-dir PATH       Artifact directory. Default: ${DEFAULT_OUTPUT_DIR}
  --auth-lines N          Number of lines to tail from auth files (default: ${AUTH_LINES})
  --journal-window TEXT   Journal lookback window (default: "${JOURNAL_WINDOW}")
  --dry-run               Print planned collection commands only.
  -h, --help              Show this help text.

Examples:
  ${SCRIPT_NAME}
  ${SCRIPT_NAME} --output-dir /tmp/ir_triage_01
  ${SCRIPT_NAME} --auth-lines 500 --journal-window "24 hours"
  ${SCRIPT_NAME} --dry-run
EOF
}

log() {
  local level="$1"
  local message="$2"
  printf '[%s] [%s] %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "${level}" "${message}"
}

fail() {
  log "ERROR" "$1"
  exit 1
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

validate_positive_int() {
  [[ "$1" =~ ^[0-9]+$ ]] && [[ "$1" -gt 0 ]]
}

validate_journal_window() {
  [[ -n "$1" ]] && [[ "$1" =~ ^[[:alnum:]][[:alnum:][:space:].:_+-]*$ ]]
}

register_skip() {
  local reason="$1"
  TOTAL_COMMANDS=$((TOTAL_COMMANDS + 1))
  SKIPPED_COMMANDS=$((SKIPPED_COMMANDS + 1))
  log "WARN" "${reason}"
}

run_capture() {
  local label="$1"
  local outfile="$2"
  local command_text="$3"
  local stderr_file

  TOTAL_COMMANDS=$((TOTAL_COMMANDS + 1))
  stderr_file="${outfile}.stderr"

  log "INFO" "Collecting: ${label}"
  if "${DRY_RUN}"; then
    printf 'DRY-RUN\t%s\t%s\t%s\n' "${label}" "${outfile}" "${command_text}"
    SUCCESSFUL_COMMANDS=$((SUCCESSFUL_COMMANDS + 1))
    return 0
  fi

  if bash -o pipefail -c "${command_text}" >"${outfile}" 2>"${stderr_file}"; then
    SUCCESSFUL_COMMANDS=$((SUCCESSFUL_COMMANDS + 1))
    if [[ ! -s "${stderr_file}" ]]; then
      rm -f "${stderr_file}"
    fi
    return 0
  fi

  FAILED_COMMANDS=$((FAILED_COMMANDS + 1))
  log "WARN" "Collection failed: ${label} (see ${stderr_file})"
}

run_if_available() {
  local binary="$1"
  local label="$2"
  local outfile="$3"
  local command_text="$4"
  if command_exists "${binary}"; then
    run_capture "${label}" "${outfile}" "${command_text}"
  else
    register_skip "Skipping ${label}: command '${binary}' not available"
  fi
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --output-dir)
        [[ $# -ge 2 ]] || fail "Missing value for --output-dir"
        OUTPUT_DIR="$2"
        shift 2
        ;;
      --auth-lines)
        [[ $# -ge 2 ]] || fail "Missing value for --auth-lines"
        validate_positive_int "$2" || fail "--auth-lines must be a positive integer"
        AUTH_LINES="$2"
        shift 2
        ;;
      --journal-window)
        [[ $# -ge 2 ]] || fail "Missing value for --journal-window"
        validate_journal_window "$2" || fail "--journal-window must contain only letters, numbers, spaces, and . : _ + -"
        JOURNAL_WINDOW="$2"
        shift 2
        ;;
      --dry-run)
        DRY_RUN=true
        shift
        ;;
      -h|--help)
        print_usage
        exit 0
        ;;
      *)
        fail "Unknown argument: $1"
        ;;
    esac
  done
}

create_directories() {
  umask 077
  mkdir -p "${OUTPUT_DIR}"/{host,volatile,processes,network,auth,logs}
  : >"${OUTPUT_DIR}/collection_plan.tsv"
}

write_metadata() {
  cat >"${OUTPUT_DIR}/host/collection_metadata.txt" <<EOF
collection_started_utc=${START_TS}
collector_user=$(id -un 2>/dev/null || echo "unknown")
collector_uid=$(id -u 2>/dev/null || echo "unknown")
hostname=${HOST_NAME}
kernel=$(uname -r 2>/dev/null || echo "unknown")
output_dir=${OUTPUT_DIR}
dry_run=${DRY_RUN}
auth_lines=${AUTH_LINES}
journal_window=${JOURNAL_WINDOW}
EOF
}

collect_host_context() {
  run_capture "UTC date/time" "${OUTPUT_DIR}/host/date_utc.txt" "date -u '+%Y-%m-%dT%H:%M:%SZ'"
  run_capture "Hostname details" "${OUTPUT_DIR}/host/hostnamectl.txt" "hostnamectl || hostname"
  run_capture "Kernel and platform" "${OUTPUT_DIR}/host/uname.txt" "uname -a"
  run_capture "Uptime" "${OUTPUT_DIR}/host/uptime.txt" "uptime"
  run_capture "Logged-in users (who -a)" "${OUTPUT_DIR}/host/who_a.txt" "who -a"
  run_capture "User activity (w)" "${OUTPUT_DIR}/host/w.txt" "w"
  run_capture "Recent login sessions (last)" "${OUTPUT_DIR}/host/last.txt" "last -F -n ${AUTH_LINES}"
}

collect_volatile_data() {
  run_if_available "free" "Memory snapshot (free -h)" "${OUTPUT_DIR}/volatile/free_h.txt" "free -h"
  run_if_available "vmstat" "VM statistics (vmstat 1 5)" "${OUTPUT_DIR}/volatile/vmstat_1_5.txt" "vmstat 1 5"
  run_if_available "df" "Filesystem usage (df -hT)" "${OUTPUT_DIR}/volatile/df_hT.txt" "df -hT"
  run_if_available "mount" "Mounted filesystems" "${OUTPUT_DIR}/volatile/mount.txt" "mount"
  run_if_available "lsmod" "Loaded kernel modules" "${OUTPUT_DIR}/volatile/lsmod.txt" "lsmod"
  run_if_available "dmesg" "Recent kernel ring buffer (last 200 lines)" "${OUTPUT_DIR}/volatile/dmesg_tail.txt" "dmesg | tail -n 200"
}

collect_process_data() {
  run_capture "Process tree (ps auxwwf)" "${OUTPUT_DIR}/processes/ps_auxwwf.txt" "ps auxwwf"
  run_capture "Process listing sorted by PID" "${OUTPUT_DIR}/processes/ps_pid_sorted.txt" "ps -eo pid,ppid,user,lstart,etime,%cpu,%mem,stat,cmd --sort=pid"
  run_if_available "pstree" "Process hierarchy (pstree -ap)" "${OUTPUT_DIR}/processes/pstree_ap.txt" "pstree -ap"
  run_if_available "top" "Top snapshot (top -b -n 1)" "${OUTPUT_DIR}/processes/top_b1.txt" "top -b -n 1"
  run_if_available "lsof" "Open files and sockets (lsof -nP)" "${OUTPUT_DIR}/processes/lsof_nP.txt" "lsof -nP"
}

collect_network_data() {
  run_if_available "ip" "IP addresses (ip -brief address)" "${OUTPUT_DIR}/network/ip_brief_address.txt" "ip -brief address"
  run_if_available "ip" "Routes (ip route show table all)" "${OUTPUT_DIR}/network/ip_routes.txt" "ip route show table all"
  run_if_available "ip" "Neighbor table (ip neigh show)" "${OUTPUT_DIR}/network/ip_neigh.txt" "ip neigh show"
  run_if_available "ss" "Active TCP/UDP sockets (ss -tunap)" "${OUTPUT_DIR}/network/ss_tunap.txt" "ss -tunap"
  run_if_available "ss" "Listening sockets (ss -ltnup)" "${OUTPUT_DIR}/network/ss_ltnup.txt" "ss -ltnup"
  run_if_available "lsof" "Socket ownership (lsof -nP -i)" "${OUTPUT_DIR}/network/lsof_i.txt" "lsof -nP -i"
  run_if_available "arp" "ARP cache" "${OUTPUT_DIR}/network/arp_an.txt" "arp -an"
}

collect_auth_data() {
  local journal_since

  run_capture "Current login accounting (lastlog)" "${OUTPUT_DIR}/auth/lastlog.txt" "lastlog"

  if [[ -r /var/log/auth.log ]]; then
    run_capture "Recent /var/log/auth.log lines" "${OUTPUT_DIR}/auth/auth_log_tail.txt" "tail -n ${AUTH_LINES} /var/log/auth.log"
  else
    register_skip "Skipping /var/log/auth.log tail: file unreadable or missing"
  fi

  if [[ -r /var/log/secure ]]; then
    run_capture "Recent /var/log/secure lines" "${OUTPUT_DIR}/auth/secure_log_tail.txt" "tail -n ${AUTH_LINES} /var/log/secure"
  else
    register_skip "Skipping /var/log/secure tail: file unreadable or missing"
  fi

  if command_exists "journalctl"; then
    printf -v journal_since '%q' "-${JOURNAL_WINDOW}"
    run_capture \
      "Auth-focused journal view" \
      "${OUTPUT_DIR}/auth/journal_auth_focus.txt" \
      "journalctl --since ${journal_since} --no-pager | grep -Ei 'sudo|sshd|authentication|failed password|accepted password|session (opened|closed)' || true"
    run_capture \
      "SSH service journal window" \
      "${OUTPUT_DIR}/auth/journal_ssh_window.txt" \
      "journalctl --since ${journal_since} --no-pager -u ssh.service -u ssh"
  else
    register_skip "Skipping journal captures: command 'journalctl' not available"
  fi
}

write_summary() {
  local finish_ts
  finish_ts="$(date -u +%Y%m%dT%H%M%SZ)"
  cat >"${OUTPUT_DIR}/SUMMARY.txt" <<EOF
incident_triage_starter_summary
started_utc=${START_TS}
finished_utc=${finish_ts}
output_dir=${OUTPUT_DIR}
dry_run=${DRY_RUN}
commands_total=${TOTAL_COMMANDS}
commands_success=${SUCCESSFUL_COMMANDS}
commands_failed=${FAILED_COMMANDS}
commands_skipped=${SKIPPED_COMMANDS}

key_artifacts:
- host/collection_metadata.txt
- volatile/free_h.txt
- processes/pstree_ap.txt
- network/ss_tunap.txt
- auth/journal_auth_focus.txt
EOF
}

main() {
  parse_args "$@"
  if ! "${DRY_RUN}"; then
    create_directories
    write_metadata
  fi

  log "INFO" "Output directory: ${OUTPUT_DIR}"
  if [[ "${EUID}" -ne 0 ]]; then
    log "WARN" "Not running as root. Some auth/process/network data may be incomplete."
  fi

  collect_host_context
  collect_volatile_data
  collect_process_data
  collect_network_data
  collect_auth_data
  if ! "${DRY_RUN}"; then
    write_summary
  fi

  if [[ "${FAILED_COMMANDS}" -gt 0 ]]; then
    log "WARN" "Collection completed with failures (${FAILED_COMMANDS}). Review *.stderr files."
  elif "${DRY_RUN}"; then
    log "INFO" "Dry-run completed."
  else
    log "INFO" "Collection completed successfully."
    log "INFO" "Summary: ${OUTPUT_DIR}/SUMMARY.txt"
  fi
}

main "$@"
