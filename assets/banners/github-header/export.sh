#!/usr/bin/env bash
# Export each banner HTML in this folder to a 2x PNG (2560x640). Run from anywhere.
set -euo pipefail
cd "$(dirname "$0")"
CHROME="${CHROME:-$(ls "$HOME"/.cache/ms-playwright/chromium-*/chrome-linux*/chrome 2>/dev/null | tail -1)}"
ROOT=$(cd ../../.. && pwd)
python3 -m http.server -d "$ROOT" 4992 >/dev/null 2>&1 & PID=$!
trap 'kill $PID 2>/dev/null || true' EXIT
for _ in $(seq 1 40); do curl -sf -o /dev/null http://127.0.0.1:4992/ && break; sleep 0.25; done
for f in *-1280x320.html; do
  "$CHROME" --headless=new --no-sandbox --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
    --virtual-time-budget=6000 --window-size=1280,320 --screenshot="${f%.html}.png" \
    "http://127.0.0.1:4992/assets/banners/github-header/$f" >/dev/null 2>&1
  echo "${f%.html}.png"
done
