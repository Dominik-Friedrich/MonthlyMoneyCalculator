#ifndef MYSETTINGS_H
#define MYSETTINGS_H

#include <QSettings>

class MySettings : public QSettings
{
    Q_OBJECT
public:
    explicit MySettings(const QString &fileName, Format format, QObject *parent = nullptr);
    explicit MySettings(QSettings::Format format, QSettings::Scope scope, const QString &organization, const QString &application = QString(), QObject *parent = nullptr);
    Q_INVOKABLE void addEntry(const QString &key, const QVariant &value);
    Q_INVOKABLE QVariant getEntry(const QString &key);
    Q_INVOKABLE QStringList getAllKeys();
    Q_INVOKABLE void mySync();
};

#endif // MYSETTINGS_H
