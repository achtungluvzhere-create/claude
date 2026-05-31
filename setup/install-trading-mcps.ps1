# Trading MCP Setup Script for Windows
# Run in PowerShell (as Administrator if npm global install fails)
# Requires: Python 3.11+, Node.js 18+, Git

Write-Host "=== Trading MCP Installer ===" -ForegroundColor Cyan

# Python MCPs
Write-Host "`n[1/4] Installing Python MCPs..." -ForegroundColor Yellow
$pythonPackages = @("tradingview-mcp-server","alpaca-mcp-server","financekit-mcp","cerebrus-pulse-mcp")
foreach ($pkg in $pythonPackages) {
    Write-Host "  Installing $pkg..." -NoNewline
    pip install $pkg --user 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { Write-Host " OK" -ForegroundColor Green }
    else { Write-Host " FAILED" -ForegroundColor Red }
}

# npm MCPs
Write-Host "`n[2/4] Installing npm MCPs..." -ForegroundColor Yellow
Write-Host "  Installing pinescript-mcp-server..." -NoNewline
npm install -g pinescript-mcp-server 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) { Write-Host " OK" -ForegroundColor Green } else { Write-Host " FAILED" -ForegroundColor Red }

# TradingView Desktop MCP (git clone)
Write-Host "`n[3/4] Cloning TradingView Desktop MCP..." -ForegroundColor Yellow
$tvMcpPath = "$env:USERPROFILE\Desktop\tradingview-mcp"
if (-not (Test-Path $tvMcpPath)) {
    git clone https://github.com/tradesdontlie/tradingview-mcp.git $tvMcpPath
    Push-Location $tvMcpPath; npm install; Pop-Location
    Write-Host "  Cloned to: $tvMcpPath" -ForegroundColor Green
} else {
    Write-Host "  Already exists at: $tvMcpPath" -ForegroundColor Yellow
}

# Instructions
Write-Host "`n[4/4] Next steps:" -ForegroundColor Yellow
Write-Host "  1. Copy config/claude_desktop_config.json to %APPDATA%\Claude\claude_desktop_config.json"
Write-Host "  2. Replace all YOUR_USERNAME and YOUR_*_KEY placeholders with real values"
Write-Host "  3. For tradingview-mcp Desktop: run TradingView.exe --remote-debugging-port=9222"
Write-Host "  4. Restart Claude Desktop"
Write-Host "`n=== Done! ===" -ForegroundColor Cyan
