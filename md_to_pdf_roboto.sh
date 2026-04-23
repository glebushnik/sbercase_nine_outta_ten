#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 input.md [output.pdf]" >&2
  exit 1
fi

input_file="$1"
output_file="${2:-${input_file%.md}.pdf}"

if [[ ! -f "$input_file" ]]; then
  echo "Input file not found: $input_file" >&2
  exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc is required but not installed" >&2
  exit 1
fi

if ! command -v weasyprint >/dev/null 2>&1; then
  echo "weasyprint is required but not installed" >&2
  exit 1
fi

work_dir="$(cd "$(dirname "$input_file")" && pwd)"
tmp_css="$(mktemp "${TMPDIR:-/tmp}/md-to-pdf-roboto.XXXXXX.css")"
trap 'rm -f "$tmp_css"' EXIT

cat > "$tmp_css" <<'CSS'
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");

@page {
  size: A4;
  margin: 18mm 16mm;
}

html {
  font-family: "Roboto", sans-serif;
  font-size: 11pt;
  line-height: 1.45;
}

body {
  font-family: "Roboto", sans-serif;
  color: #111;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Roboto", sans-serif;
  font-weight: 700;
  line-height: 1.2;
  margin-top: 1.1em;
  margin-bottom: 0.45em;
}

h1 {
  font-size: 20pt;
}

h2 {
  font-size: 15pt;
}

h3 {
  font-size: 12.5pt;
}

p,
li {
  margin-top: 0.15em;
  margin-bottom: 0.35em;
}

ul {
  padding-left: 1.2em;
}

strong {
  font-weight: 500;
}
CSS

mkdir -p "$(dirname "$output_file")"

pandoc "$input_file" \
  --from markdown \
  --pdf-engine=weasyprint \
  --css "$tmp_css" \
  --resource-path "$work_dir" \
  -o "$output_file"

echo "Saved PDF: $output_file"
