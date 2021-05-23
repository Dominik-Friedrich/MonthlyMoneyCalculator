#ifndef ITEM_H
#define ITEM_H

#include <string>

namespace MyDatastructures
{

    enum Cycle {monthly = 0, daily = 1, quartaly = 2, bi_yearly = 3, yearly = 4 };

    class Item
    {
        double _dAmount;
        Cycle _eCycle;
        std::string _sDescription;
    public:
        Item(double dAmount, Cycle eCycle, std::string& sDescription);
        Item(double dAmount, int iCycle, std::string sDescription);

        static MyDatastructures::Cycle parseIntToCycle(int iCycle);
    };
}

#endif // ITEM_H
