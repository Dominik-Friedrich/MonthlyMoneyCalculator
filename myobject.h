#ifndef MYOBJECT_H
#define MYOBJECT_H

#include <QObject>
#include <string>
#include "item.h"

class MyObject : public QObject
{
    Q_OBJECT
    // list of items?
public:
    explicit MyObject(QObject *parent = nullptr);
    //~MyObject();
    Q_INVOKABLE QString addNewItem(QString sAmount, int iCycle, QString sDescription);
    void addToListModel(QString& sAmount, int iCycle, QString& sDescription);
signals:

};

#endif // MYOBJECT_H
