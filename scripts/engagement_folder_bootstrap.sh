#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  engagement_folder_bootstrap.sh --root <engagement_root> --client <client_name>

Description:
  Creates standardized engagement directories:
    recon, exploits, loot, notes, report

Options:
  --root    Base directory for engagements (required)
  --client  Client name used as the folder name (required)
  -h, --help  Show this help message

Examples:
  engagement_folder_bootstrap.sh --root ~/engagements --client acme
EOF
}

ENGAGEMENT_ROOT=""
CLIENT_NAME=""

while (($#)); do
  case "$1" in
    --root)
      if (($# < 2)); then
        echo "Error: --root requires a value." >&2
        exit 1
      fi
      ENGAGEMENT_ROOT="$2"
      shift 2
      ;;
    --client)
      if (($# < 2)); then
        echo "Error: --client requires a value." >&2
        exit 1
      fi
      CLIENT_NAME="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Error: Unknown argument '$1'." >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$ENGAGEMENT_ROOT" || -z "$CLIENT_NAME" ]]; then
  echo "Error: --root and --client are required." >&2
  usage >&2
  exit 1
fi

# Keep names filesystem-safe and reject placeholder values from copied templates.
if [[ "$CLIENT_NAME" =~ [/\ ] ]]; then
  echo "Error: client name must not contain '/' or spaces." >&2
  exit 1
fi
if [[ "$CLIENT_NAME" == \<*\> ]]; then
  echo "Error: client name looks like an unreplaced placeholder ($CLIENT_NAME)." >&2
  exit 1
fi

TARGET_BASE="${ENGAGEMENT_ROOT%/}/${CLIENT_NAME}"

for subdir in recon exploits loot notes report; do
  mkdir -p "$TARGET_BASE/$subdir"
done

echo "Created/verified engagement structure at: $TARGET_BASE"
