#!/usr/bin/env bash

set -euo pipefail

TARGET_FILE="$HOME/targets.txt"
OUTPUT_DIR="$HOME/engagements/recon"
TOP_PORT_COUNT=5

usage() {
  cat <<'EOF'
Usage: fast_host_sweep.sh [--targets FILE] [--output-dir DIR] [--top-ports N]

Run nmap service and OS detection against a target list and summarize
top open ports per host.

Options:
  --targets FILE     Target list file (default: ~/targets.txt)
  --output-dir DIR   Output directory (default: ~/engagements/recon)
  --top-ports N      Number of open ports to report per host (default: 5)
  -h, --help         Show this help message

Examples:
  ./workflows/fast_host_sweep.sh
  ./workflows/fast_host_sweep.sh --targets ~/lab/targets.txt --top-ports 8
EOF
}

log() {
  printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*"
}

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Error: required command not found: %s\n' "$1" >&2
    exit 1
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --targets)
      if [[ $# -lt 2 ]]; then
        printf 'Error: option requires a value: %s\n\n' "$1" >&2
        usage >&2
        exit 1
      fi
      TARGET_FILE="${2:-}"
      shift 2
      ;;
    --output-dir)
      if [[ $# -lt 2 ]]; then
        printf 'Error: option requires a value: %s\n\n' "$1" >&2
        usage >&2
        exit 1
      fi
      OUTPUT_DIR="${2:-}"
      shift 2
      ;;
    --top-ports)
      if [[ $# -lt 2 ]]; then
        printf 'Error: option requires a value: %s\n\n' "$1" >&2
        usage >&2
        exit 1
      fi
      TOP_PORT_COUNT="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Error: unknown option: %s\n\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$TARGET_FILE" || -z "$OUTPUT_DIR" || -z "$TOP_PORT_COUNT" ]]; then
  printf 'Error: --targets, --output-dir, and --top-ports values cannot be empty.\n' >&2
  exit 1
fi

if ! [[ "$TOP_PORT_COUNT" =~ ^[0-9]+$ ]] || [[ "$TOP_PORT_COUNT" -lt 1 ]]; then
  printf 'Error: --top-ports must be a positive integer.\n' >&2
  exit 1
fi

if [[ ! -f "$TARGET_FILE" ]]; then
  printf 'Error: target list file not found: %s\n' "$TARGET_FILE" >&2
  exit 1
fi

if [[ ! -s "$TARGET_FILE" ]]; then
  printf 'Error: target list file is empty: %s\n' "$TARGET_FILE" >&2
  exit 1
fi

require_command nmap
require_command sort
require_command date

mkdir -p "$OUTPUT_DIR"

scan_id="fast_host_sweep_$(date '+%Y%m%d_%H%M%S')"
scan_prefix="$OUTPUT_DIR/$scan_id"
scan_log="${scan_prefix}.log"
summary_file="${scan_prefix}_summary.md"
gnmap_file="${scan_prefix}.gnmap"

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  log "Warning: nmap OS detection (-O) may fail when run without root privileges." | tee -a "$scan_log"
fi

log "Starting fast host sweep using targets from: $TARGET_FILE" | tee -a "$scan_log"
log "Writing outputs under: $scan_prefix.[nmap|xml|gnmap]" | tee -a "$scan_log"

nmap_cmd=(nmap -sV -O -iL "$TARGET_FILE" -oA "$scan_prefix")
log "Running: ${nmap_cmd[*]}" | tee -a "$scan_log"
if ! "${nmap_cmd[@]}" | tee -a "$scan_log"; then
  log "Warning: nmap exited with a non-zero status; proceeding with any generated output." | tee -a "$scan_log"
fi

if [[ ! -f "$gnmap_file" ]]; then
  printf 'Error: expected grepable output not found: %s\n' "$gnmap_file" >&2
  exit 1
fi

{
  printf '# Fast Host Sweep Summary\n\n'
  printf -- '- Scan ID: `%s`\n' "$scan_id"
  printf -- '- Target list: `%s`\n' "$TARGET_FILE"
  printf -- '- XML output: `%s.xml`\n' "$scan_prefix"
  printf -- '- Grepable output: `%s.gnmap`\n' "$scan_prefix"
  printf -- '- Plain output: `%s.nmap`\n' "$scan_prefix"
  printf -- '- Generated: `%s`\n\n' "$(date '+%Y-%m-%d %H:%M:%S %Z')"
  printf '## Top Open Ports per Host (up to %s)\n\n' "$TOP_PORT_COUNT"
} > "$summary_file"

found_hosts=0

while IFS= read -r line; do
  [[ "$line" == *"Ports:"* ]] || continue

  if [[ "$line" =~ ^Host:[[:space:]]+([^[:space:]]+) ]]; then
    host="${BASH_REMATCH[1]}"
  else
    continue
  fi

  ports_section="${line#*Ports: }"
  IFS=',' read -r -a entries <<< "$ports_section"

  open_ports=()
  for entry in "${entries[@]}"; do
    entry="$(echo "$entry" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
    [[ "$entry" == */open/* ]] || continue
    open_ports+=("${entry%%/*}")
  done

  if [[ "${#open_ports[@]}" -eq 0 ]]; then
    continue
  fi

  mapfile -t sorted_ports < <(printf '%s\n' "${open_ports[@]}" | sort -n -u)
  top_ports=("${sorted_ports[@]:0:TOP_PORT_COUNT}")
  printf -v ports_display '%s, ' "${top_ports[@]}"
  ports_display="${ports_display%, }"

  {
    printf '### %s\n' "$host"
    printf -- '- Open ports: %s\n\n' "$ports_display"
  } >> "$summary_file"

  found_hosts=1
done < "$gnmap_file"

if [[ "$found_hosts" -eq 0 ]]; then
  printf 'No hosts with open ports were found in `%s`.\n\n' "$gnmap_file" >> "$summary_file"
fi

cat <<EOF >> "$summary_file"
## Next Actions

1. Review \`$scan_prefix.xml\` in your preferred tooling (e.g., searchsploit, Metasploit import, or diffing).
2. Prioritize hosts with exposed management ports (SSH, RDP, WinRM, SNMP, SMB).
3. Follow up with targeted scripts (banner checks, vuln scripts, or service-specific enumeration).
EOF

log "Scan complete." | tee -a "$scan_log"
log "Summary written to: $summary_file" | tee -a "$scan_log"
log "Primary artifacts:" | tee -a "$scan_log"
log "  - $scan_prefix.xml" | tee -a "$scan_log"
log "  - $scan_prefix.gnmap" | tee -a "$scan_log"
log "  - $scan_prefix.nmap" | tee -a "$scan_log"
