# Trading MCP Capabilities Reference

## tradingview (27 tools)

### Screeners
- `top_gainers` / `top_losers` — top movers by Bollinger Band analysis
- `bollinger_scan` — squeeze detection (low BBW)
- `rating_filter` — filter by BB rating -3 (strong sell) to +3 (strong buy)

### Asset Analysis
- `coin_analysis` — full indicator breakdown for any symbol
- `multi_timeframe_analysis` — Weekly → Daily → 4H → 1H → 15m alignment
- `combined_analysis` — TA + Reddit sentiment + news in one call
- `multi_agent_analysis` — 3-agent debate (Technical / Sentiment / Risk) → final decision

### Volume
- `volume_breakout_scanner` — volume spike + price breakout detection
- `volume_confirmation_analysis` — detailed volume for one symbol
- `smart_volume_scanner` — volume + RSI filter combined

### Candle Patterns
- `consecutive_candles_scan` — N consecutive growing/shrinking candles
- `advanced_candle_pattern` — multi-timeframe pattern analysis

### Backtesting
- `backtest_strategy` — Sharpe, Calmar, max DD, equity curve, trade log
- `compare_strategies` — all 6 strategies ranked as leaderboard
- `walk_forward_backtest_strategy` — fold validation to detect overfitting

Strategies: rsi | bollinger | macd | ema_cross | supertrend | donchian

### Sentiment & News
- `market_sentiment` — live Reddit sentiment scoring
- `financial_news` — Reuters, CoinDesk RSS feeds

### Price Data
- `yahoo_price` — real-time quote (stocks, crypto, ETFs, indices, FX)
- `market_snapshot` — global overview: indices, crypto, FX, ETFs

### EGX (Egyptian Exchange) — 7 tools
egx_market_overview, egx_sector_scan, egx_sector_scanner,
egx_index_analysis, egx_stock_screener, egx_trade_plan, egx_fibonacci_retracement

---

## alpaca (60+ tools)

- Place/cancel/replace orders — stocks, crypto, options
- get_all_positions / close_position / close_all_positions
- get_portfolio_history — P&L over time
- get_stock_bars / get_crypto_bars — OHLCV historical data
- get_stock_snapshot / get_crypto_snapshot — full market snapshot
- get_option_chain — options chain data
- get_market_movers / get_most_active_stocks
- get_news — market news feed
- Watchlist management (create, update, delete)
- Account config and activity history

Paper trading URL: https://paper-api.alpaca.markets (zero risk, free)

---

## pinescript-mcp

- Validate Pine Script syntax before pasting into TradingView
- Generate Pine strategies from natural language descriptions
- Auto-fix compile errors

---

## tradingview-mcp (Desktop CDP — ~68 tools)

Requires TradingView Desktop running with --remote-debugging-port=9222

- Read live chart state (symbol, timeframe, active indicators)
- Inject and compile Pine Script directly into TradingView
- Automate chart interactions
- tv_health_check — verify CDP connection

---

## financekit-mcp (17 tools)

- stock_quote / multi_quote / company_info
- crypto_price / crypto_trending / crypto_top_coins (CoinGecko)
- technical_analysis — RSI, MACD, Bollinger Bands, ADX, Stochastic, ATR, OBV
- price_history — OHLCV data
- market_overview — major indices, VIX, sentiment
- compare_assets — Sharpe ratio, Beta, VaR, Sortino, Max Drawdown
- portfolio_analysis
No API keys required.

---

## cerebrus-pulse-mcp (15 tools)

Focused on Hyperliquid perpetuals (50+ assets).

Free tools (no wallet needed):
- RSI, EMAs, ATR, Bollinger Bands, VWAP, Z-score
- Trend/regime/confluence analysis
- Market stress index

Premium tools (USDC micropayments via Base/Solana):
- Liquidation heatmaps
- CEX-DEX divergence
- Chainlink basis
- USDC depeg monitoring

---

## Gold Trading Note

For XAUUSD/Gold:
- Price data: yahoo_price with GC=F (futures) or GLD (ETF)
- Backtesting: backtest_strategy / compare_strategies on GC=F or GLD
- Sentiment: market_sentiment with GOLD
- Execution: use PineConnector -> MT5 for XAUUSD CFDs (not covered by these MCPs)
