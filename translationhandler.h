#ifndef TRANSLATIONHANDLER_H
#define TRANSLATIONHANDLER_H
#include <QTranslator>
#include <QString>
#include <QGuiApplication>
#include <QObject>
#include <QDebug>
#include <QQmlEngine>

class TranslationHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    explicit TranslationHandler(QQmlEngine *engine);
    QString getEmptyString();
    Q_INVOKABLE QString getCurrentLanguage();
    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();

private:
    QTranslator *m_translator1;
    QString m_currentLanguage;
    QQmlEngine *m_engine;

public slots:
};

#endif // TRANSLATIONHANDLER_H
