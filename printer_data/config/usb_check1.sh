#!/usr/bin/env bash
# usb_check.sh - reliable single-token output for Klipper macros
# Exits 0 when USB log folder is present, 1 otherwise

USB_DIR="/media/PRINT_LOGS/klipper_logs"
PI_DIR="/home/pi/print_logs"

# Prefer USB if mounted and directory exists
if mountpoint -q /media/PRINT_LOGS && [ -d "$USB_DIR" ]; then
  printf 'USB_PRESENT'
  exit 0
fi

# If USB not present, but Pi folder exists, report missing USB
if [ -d "$PI_DIR" ]; then
  printf 'USB_MISSING'
  exit 1
fi

# Neither directory exists: still return USB_MISSING but keep output minimal
printf 'USB_MISSING'
exit 1
