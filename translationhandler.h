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
    explicit TranslationHandler(QQmlEngine *engine)
    {
        m_translator1 = new QTranslator(this);
        m_currentLanguage = "en";
        m_engine = engine;
    }

    QString getEmptyString()
    {
        return "";
    }

    Q_INVOKABLE QString getCurrentLanguage()
    {
        return m_currentLanguage;
    }

    Q_INVOKABLE void selectLanguage(QString language)
    {
        if(language == QString("de"))
        {
            m_currentLanguage = language;
            m_translator1->load(":/i18n/MonthlyMoneyCalculator_de_DE.qm");
            qGuiApp->installTranslator(m_translator1);
            m_engine->retranslate();
        }
        if(language == QString("en"))
        {
            m_currentLanguage = language;
            qGuiApp->removeTranslator(m_translator1);
            m_engine->retranslate();
        }
        emit languageChanged();
    }

signals:
    void languageChanged();

private:
    QTranslator *m_translator1;
    QString m_currentLanguage;
    QQmlEngine *m_engine;

public slots:
};

#endif // TRANSLATIONHANDLER_H
