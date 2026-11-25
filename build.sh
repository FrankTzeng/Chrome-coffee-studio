#!/usr/bin/env bash
# Render build step for the Chrome Coffee Studio static site.
# The site's photos/videos are stored in this repo as base64 text files
# under src-assets/ (so they can be managed as plain text). This script
# decodes them back into real files under public/assets/ and copies
# index.html alongside, producing the exact site in public/.
set -euo pipefail
cd "$(dirname "$0")"
rm -rf public
mkdir -p public/assets
cp index.html public/index.html
cd src-assets
find . -type f -name '*.b64' | while read -r f; do
  rel="${f#./}"
  rel="${rel%.b64}"
  mkdir -p "../public/assets/$(dirname "$rel")"
  base64 -d "$f" > "../public/assets/$rel"
done
echo "Build complete:"
find ../public -type f | wc -l
