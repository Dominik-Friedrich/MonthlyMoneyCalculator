#include "myobject.h"

MyDatastructures::MyObject::MyObject(QObject *parent) : QObject(parent)
{
     _pItemList = new std::vector<MyDatastructures::Item>();
     _dMonthlyAllowance = 0;
}

MyDatastructures::MyObject::~MyObject()
{
    delete  _pItemList;
}

Q_INVOKABLE QString MyDatastructures::MyObject::addNewItem(QString sAmount, int iCycle, QString sDescription)
{
    double dAmount = sAmount.toDouble();
    MyDatastructures::Item item(dAmount, iCycle, sDescription.toStdString());

    _pItemList->push_back(item);
    _dMonthlyAllowance += dAmount;

    QString string = sAmount+" "+QString::number(iCycle)+" "+sDescription;
    return string;
}

void MyDatastructures::MyObject::addToListModel(QString& sAmount, int iCycle, QString& sDescription)
{
    // I don't think I'll use this
}
