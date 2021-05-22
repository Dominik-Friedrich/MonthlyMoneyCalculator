#include "item.h"

Item::Item(int iAmount, int iCycle, std::string& sDescription)
{
    this->_iAmount = iAmount;
    this->_iCycle = iCycle;
    this->_sDescription = sDescription;
}
