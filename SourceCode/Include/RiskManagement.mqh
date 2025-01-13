// RiskManagement.mqh

class RiskManagement {
private:
    double riskPercentage;
    int leverage;

public:
    void SetRisk(double percentage) { riskPercentage = percentage; }
    void SetLeverage(int lev) { leverage = lev; }

    double CalculateLotSize(double entryPrice, double stopLossPrice, double accountBalance) {
        double riskAmount = accountBalance * (riskPercentage / 100.0);
        return riskAmount / (MathAbs(entryPrice - stopLossPrice) * leverage);
    }
};