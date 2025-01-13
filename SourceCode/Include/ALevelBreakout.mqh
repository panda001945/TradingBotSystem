// ALevelBreakout.mqh
#include <Arrays\ArrayDouble.mqh>

class ALevelBreakout {
private:
    CArrayDouble highs;

public:
    void AddHigh(double price) { highs.Add(price); }
    bool IsBreakout() {
        if(highs.Total() < 2) return false;
        double lastHigh = highs[highs.Total() - 1];
        double secondLastHigh = highs[highs.Total() - 2];
        return (iClose(NULL, 0, 0) > lastHigh && lastHigh > secondLastHigh);
    }
};