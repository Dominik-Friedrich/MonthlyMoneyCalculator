#include "item.h"

MyDatastructures::Item::Item(double dAmount, Cycle eCycle, std::string& sDescription)
{
    this->_dAmount = dAmount;
    this->_eCycle = eCycle;
    this->_sDescription = sDescription;
}

MyDatastructures::Item::Item(double dAmount, int iCycle, std::string sDescription)
{
    this->_dAmount = dAmount;
    this->_eCycle = parseIntToCycle(iCycle);
    this->_sDescription = sDescription;
}

MyDatastructures::Cycle MyDatastructures::Item::parseIntToCycle(int iCycle)
{
    return static_cast<MyDatastructures::Cycle>(iCycle);
}
