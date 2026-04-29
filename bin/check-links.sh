#!/usr/bin/env bash
# Run html-proofer against the locally built _site/.
#
# Usage:
#   bin/check-links.sh             # internal links only (fast)
#   bin/check-links.sh --external  # internal + external (slow, hits the network)
#
# Requires: bundle install (one-time), then bundle exec jekyll build before running.

set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -d _site ]; then
  echo "_site/ not found — running 'bundle exec jekyll build' first..."
  bundle exec jekyll build
fi

# URLs to ignore (regex). Add new known false-positives or unfixable legacy URLs here.
URL_IGNORE='/jsd-widget.atlassian.com/'

COMMON_OPTS=(
  --allow-hash-href
  --empty-alt-ignore
  --url-ignore "$URL_IGNORE"
  --typhoeus-config '{"timeout":15,"connecttimeout":10}'
  --hydra-config '{"max_concurrency":4}'
)

if [ "${1:-}" = "--external" ]; then
  echo "Running html-proofer (internal + external)..."
  exec bundle exec htmlproofer ./_site "${COMMON_OPTS[@]}"
else
  echo "Running html-proofer (internal only)..."
  exec bundle exec htmlproofer ./_site --disable-external "${COMMON_OPTS[@]}"
fi
