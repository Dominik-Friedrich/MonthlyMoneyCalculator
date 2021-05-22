#include "myobject.h"

MyObject::MyObject(QObject *parent) : QObject(parent)
{

}

Q_INVOKABLE QString MyObject::addNewItem(QString sAmount, int iCycle, QString sDescription)
{
    QString string = sAmount+" "+QString::number(iCycle)+" "+sDescription;
    // Something
    return string;
}

void MyObject::addToListModel(QString& sAmount, int iCycle, QString& sDescription)
{

}
