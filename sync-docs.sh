#!/usr/bin/env bash
set -euo pipefail

# ——————————————————————————————————————————————————————————————
# Load .env and export all variables
# ——————————————————————————————————————————————————————————————
if [[ -f .env ]]; then
  # export all vars in .env (skipping blank lines and comments)
  set -o allexport
  # shellcheck disable=SC1091
  source .env
  set +o allexport
else
  echo "❌  .env file not found in $(pwd)"
  exit 1
fi

# ——————————————————————————————————————————————————————————————
# Variables we expect from .env:
#   DOCS_SOURCE                   e.g. docs/_build/html
#   WHEEL_HTML_INDEX_COMPATIBLE   e.g. wheel-html-index
# ——————————————————————————————————————————————————————————————
: "${DOCS_SOURCE:?Need to set DOCS_SOURCE in .env}"
: "${WHEEL_HTML_INDEX_COMPATIBLE:?Need to set WHEEL_HTML_INDEX_COMPATIBLE in .env}"

# ——————————————————————————————————————————————————————————————
# 1. Clean out old docs (And create .nojekyll)
# ——————————————————————————————————————————————————————————————
echo "🧹  Cleaning docs/…"
rm -rf docs
mkdir -p docs
touch docs/.nojekyll

# ——————————————————————————————————————————————————————————————
# 2. Copy generated Sphinx HTML
# ——————————————————————————————————————————————————————————————
echo "📖  Copying Sphinx output from ${DOCS_SOURCE} → docs/"
cp -a "${DOCS_SOURCE}/." docs/

# # ——————————————————————————————————————————————————————————————
# # 3. Copy release/ into docs/${WHEEL_HTML_INDEX_COMPATIBLE}/
# # ——————————————————————————————————————————————————————————————
# TARGET="docs/${WHEEL_HTML_INDEX_COMPATIBLE}"
# echo "📦  Copying release/ → ${TARGET}/"
# mkdir -p "${TARGET}"
# cp -a release/. "${TARGET}/"

# echo "✅  Done! Your docs/ folder is now up-to-date."
