#!/usr/bin/env bash
set -euo pipefail

OUT="/tmp/usb_status.txt"
TMP="${OUT}.tmp"
USB_DIR="/media/PRINT_LOGS/klipper_logs"
PI_DIR="/home/pi/print_logs"

if mountpoint -q /media/PRINT_LOGS && [ -d "$USB_DIR" ]; then
  printf '%s\n' "$USB_DIR" > "$TMP"
  mv "$TMP" "$OUT"
  printf '%s\n' "$USB_DIR"
  exit 0
fi

if [ -d "$PI_DIR" ]; then
  printf '%s\n' "$PI_DIR" > "$TMP"
  mv "$TMP" "$OUT"
  printf '%s\n' "$PI_DIR"
  exit 0
fi

# nothing found — write empty file and return success
printf '' > "$TMP"
mv "$TMP" "$OUT"
printf '\n'
exit 0
