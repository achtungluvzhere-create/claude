# Claude Trading MCP Setup

Full trading intelligence stack connected to Claude Desktop on Windows.

## MCPs Installed

| MCP | Package | What it does |
|-----|---------|-------------|
| `tradingview` | `tradingview-mcp-server` (PyPI) | 27 tools: screener, backtesting, multi-TF analysis, Reddit sentiment, news |
| `alpaca` | `alpaca-mcp-server` (PyPI) | Live/paper trading — stocks, ETFs, crypto, options |
| `pinescript-mcp` | `pinescript-mcp-server` (npm) | Pine Script syntax validation, NL → strategy generation |
| `tradingview-mcp` | `tradesdontlie/tradingview-mcp` (GitHub) | Connects Claude to live TradingView chart via Chrome CDP |
| `financekit-mcp` | `financekit-mcp` (PyPI) | 17 tools: quotes, RSI/MACD/BB/ADX, Sharpe/Beta/VaR |
| `cerebrus-pulse-mcp` | `cerebrus-pulse-mcp` (PyPI) | 15 tools: Hyperliquid perps TA, funding rates, liquidation heatmaps |

Plus base MCPs: `github`, `filesystem`, `memory`, `fetch`, `sequential-thinking`

## Quick Start

1. Run `setup/install-trading-mcps.ps1` in PowerShell
2. Copy `config/claude_desktop_config.json` to `%APPDATA%\Claude\claude_desktop_config.json`
3. Fill in your secrets (search for `YOUR_` placeholders)
4. For `tradingview-mcp` (Desktop CDP): launch TradingView with `--remote-debugging-port=9222`
5. Restart Claude Desktop

## Secrets Required

- `GITHUB_PERSONAL_ACCESS_TOKEN` — github.com/settings/tokens
- `ALPACA_API_KEY` + `ALPACA_SECRET_KEY` — app.alpaca.markets (free paper trading)
- `CEREBRUS_WALLET_KEY` — optional, only for premium Cerebrus tools (USDC on Base chain)

## TradingView Desktop CDP (manual step)

```bat
"%LOCALAPPDATA%\Programs\TradingView\TradingView.exe" --remote-debugging-port=9222
```

Then ask Claude: "run tv_health_check" — should return `cdp_connected: true`.

## Backtesting Strategies

`rsi` | `bollinger` | `macd` | `ema_cross` | `supertrend` | `donchian`

## Exchanges Supported

Crypto: BINANCE, KUCOIN, BYBIT, MEXC, OKX, COINBASE, KRAKEN, GATEIO
Stocks: NASDAQ, NYSE, BIST, EGX, HKEX, SSE, SZSE, BURSA
