#ifndef ITEM_H
#define ITEM_H

#include <string>

enum eCycle {monthly, daily, quartaly, bi_yearly, yearly };

class Item
{
    int _iAmount;
    int _iCycle;
    std::string _sDescription;
public:
    Item(int iAmount, int iCycle, std::string& sDescription);
};

#endif // ITEM_H
