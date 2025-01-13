// TradeExecution.mqh

#include <Trade\Trade.mqh>

class TradeExecution {
private:
    CTrade trade;

public:
    void ExecuteBuy(double lotSize, double price) {
        trade.Buy(lotSize, NULL, price, 0, 0, "Buy Signal");
    }

    void ExecuteSell(double lotSize, double price) {
        trade.Sell(lotSize, NULL, price, 0, 0, "Sell Signal");
    }

    void CloseTrade() {
        trade.PositionClose(NULL);
    }
};