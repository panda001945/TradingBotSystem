// EngulfingPattern.mqh

class EngulfingPattern {
public:
    bool IsBullishEngulfing(int shift) {
        // Check for a small bearish candle followed by a larger bullish candle
        return (iClose(NULL, 0, shift + 1) < iOpen(NULL, 0, shift + 1) && 
                iClose(NULL, 0, shift) > iOpen(NULL, 0, shift) && 
                iClose(NULL, 0, shift) > iOpen(NULL, 0, shift + 1) && 
                iOpen(NULL, 0, shift) < iClose(NULL, 0, shift + 1));
    }

    bool IsBearishEngulfing(int shift) {
        // Check for a small bullish candle followed by a larger bearish candle
        return (iClose(NULL, 0, shift + 1) > iOpen(NULL, 0, shift + 1) && 
                iClose(NULL, 0, shift) < iOpen(NULL, 0, shift) && 
                iClose(NULL, 0, shift) < iOpen(NULL, 0, shift + 1) && 
                iOpen(NULL, 0, shift) > iClose(NULL, 0, shift + 1));
    }
};