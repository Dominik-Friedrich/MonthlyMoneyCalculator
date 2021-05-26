#include "mysettings.h"

MySettings::MySettings(const QString &fileName, Format format, QObject *parent) : QSettings(fileName, format, parent)
{
}

MySettings::MySettings(Format format, Scope scope, const QString &organization, const QString &application, QObject *parent) : QSettings(format, scope, organization, application, parent)
{
}

void MySettings::addEntry(const QString &key, const QVariant &value)
{
    setValue(key, value);
}

QVariant MySettings::getEntry(const QString &key)
{
    return value(key);
}

QStringList MySettings::getAllKeys()
{
    return allKeys();
}

void MySettings::mySync()
{
    sync();
}
