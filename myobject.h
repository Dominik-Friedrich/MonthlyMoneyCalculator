#ifndef MYOBJECT_H
#define MYOBJECT_H

#include <QObject>
#include <vector>
#include "item.h"

namespace MyDatastructures
{
    class MyObject : public QObject
    {
        Q_OBJECT
        std::vector<MyDatastructures::Item>* _pItemList;
    public:
        explicit MyObject(QObject *parent = nullptr);
        ~MyObject();
        Q_INVOKABLE QString addNewItem(QString sAmount, int iCycle, QString sDescription);
    signals:

    };
}
#endif // MYOBJECT_H
