#include "myobject.h"

MyDatastructures::MyObject::MyObject(QObject *parent) : QObject(parent)
{
     _pItemList = new std::vector<MyDatastructures::Item>();
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

    QString string = sAmount+" "+QString::number(iCycle)+" "+sDescription;
    return string;
}
