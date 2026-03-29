#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for redwoodjs/graphql
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.
# Expected to run from the docs/ directory (docusaurusRoot).

echo "[INFO] Node version: $(node -v)"

# --- Yarn 4 via corepack ---
echo "[INFO] Enabling corepack for yarn@4.6.0..."
corepack enable
corepack prepare yarn@4.6.0 --activate

echo "[INFO] Yarn version: $(yarn --version)"

# --- Dependencies ---
echo "[INFO] Installing dependencies..."
yarn install --immutable

# --- Build ---
echo "[INFO] Running build..."
yarn build

echo "[DONE] Build complete."
