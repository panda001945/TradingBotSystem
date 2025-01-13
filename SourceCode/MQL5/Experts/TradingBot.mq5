// TradingBot.mq5
#include <ALevelBreakout.mqh>
#include <VLevelBreakout.mqh>
#include <EngulfingPattern.mqh>
#include <RiskManagement.mqh>
#include <TradeExecution.mqh>

input double RiskPercentage = 1.0; // Risk percentage per trade
input int Leverage = 100; // Leverage

ALevelBreakout aLevel;
VLevelBreakout vLevel;
EngulfingPattern engulfing;
RiskManagement risk;
TradeExecution trade;

int OnInit() {
    risk.SetRisk(RiskPercentage);
    risk.SetLeverage(Leverage);
    return(INIT_SUCCEEDED);
}

void OnTick() {
    double high = iHigh(NULL, 0, 0);
    double low = iLow(NULL, 0, 0);
    double close = iClose(NULL, 0, 0);

    // Check for A-level breakout
    aLevel.AddHigh(high);
    if(aLevel.IsBreakout() && engulfing.IsBullishEngulfing(1)) {
        double lotSize = risk.CalculateLotSize(close, low, AccountBalance());
        trade.ExecuteBuy(lotSize, close);
    }

    // Check for V-level breakout
    vLevel.AddLow(low);
    if(vLevel.IsBreakout() && engulfing.IsBearishEngulfing(1)) {
        double lotSize = risk.CalculateLotSize(close, high, AccountBalance());
        trade.ExecuteSell(lotSize, close);
    }
}

void OnDeinit(const int reason) {
    // Clean up if needed
}