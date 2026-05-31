#!/bin/bash
set -euo pipefail

# Only run in remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

echo "=== Installing trading MCP servers ===" >&2

# Install Python MCPs via uv (regular pip fails on sgmllib3k dependency)
uv pip install --system --quiet \
  tradingview-mcp-server \
  financekit-mcp \
  cerebrus-pulse-mcp \
  alpaca-mcp-server 2>&1 | grep -v "^$" >&2 || true

# Install Pine Script MCP via npm
npm install -g pinescript-mcp-server --silent 2>&1 >&2 || true

echo "=== Trading MCP servers ready ===" >&2
