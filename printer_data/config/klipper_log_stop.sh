#!/bin/bash

# Stop Klipper per‑print logging safely
PIDFILE="/tmp/klipper_log.pid"

# If no PID file exists, nothing to stop
if [ ! -f "$PIDFILE" ]; then
    echo "No logging PID file found. Nothing to stop."
    exit 0
fi

PID=$(cat "$PIDFILE")

# If the process is not running, clean up and exit
if ! kill -0 "$PID" 2>/dev/null; then
    echo "Logging process not running. Cleaning up PID file."
    rm -f "$PIDFILE"
    exit 0
fi

# Kill the logging process
kill "$PID" 2>/dev/null

# Remove PID file
rm -f "$PIDFILE"

echo "Logging stopped successfully."
exit 0
