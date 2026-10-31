#!/usr/bin/env bash
# Screenshot the share cards under dist/og/ into public/assets/og/.
# Usage: npm run og            (builds first, then exports)
#        CHROME=/path/to/chrome npm run og
set -euo pipefail
cd "$(dirname "$0")/.."

CHROME="${CHROME:-$(command -v google-chrome || command -v chromium || command -v chromium-browser || true)}"
if [ -z "$CHROME" ]; then
  for c in "$HOME"/.cache/ms-playwright/chromium-*/chrome-linux*/chrome; do [ -x "$c" ] && CHROME="$c"; done
fi
[ -n "${CHROME:-}" ] && [ -x "$CHROME" ] || { echo "No Chrome found. Set CHROME=/path/to/chrome" >&2; exit 1; }

[ -d dist/og ] || { echo "dist/og missing: run npm run build first" >&2; exit 1; }
mkdir -p public/assets/og

PORT=4998
python3 -m http.server -d dist "$PORT" >/dev/null 2>&1 & SERVER=$!
trap 'kill $SERVER 2>/dev/null || true' EXIT
for _ in $(seq 1 40); do curl -sf -o /dev/null "http://127.0.0.1:$PORT/" && break; sleep 0.25; done

for dir in dist/og/*/; do
  card=$(basename "$dir")
  html="$dir/index.html"
  width=$(grep -o 'data-width="[0-9]*"' "$html" | grep -o '[0-9]*')
  height=$(grep -o 'data-height="[0-9]*"' "$html" | grep -o '[0-9]*')
  out="public/assets/og/$card.png"
  "$CHROME" --headless=new --no-sandbox --disable-gpu --hide-scrollbars \
    --virtual-time-budget=6000 --window-size="${width},${height}" \
    --screenshot="$out" "http://127.0.0.1:$PORT/og/$card/" >/dev/null 2>&1
  echo "$out (${width}x${height})"
done
