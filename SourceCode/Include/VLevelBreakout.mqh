// VLevelBreakout.mqh
#include <Arrays\ArrayDouble.mqh>

class VLevelBreakout {
private:
    CArrayDouble lows;

public:
    void AddLow(double price) { lows.Add(price); }
    bool IsBreakout() {
        if(lows.Total() < 2) return false;
        double lastLow = lows[lows.Total() - 1];
        double secondLastLow = lows[lows.Total() - 2];
        return (iClose(NULL, 0, 0) < lastLow && lastLow < secondLastLow);
    }
};