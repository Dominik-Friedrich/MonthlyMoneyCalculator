#include "translationhandler.h"

TranslationHandler::TranslationHandler(QQmlEngine *engine)
{
    m_translator1 = new QTranslator(this);
    m_currentLanguage = "en";
    m_engine = engine;
}

QString TranslationHandler::getEmptyString()
{
    return "";
}

QString TranslationHandler::getCurrentLanguage()
{
    return m_currentLanguage;
}

void TranslationHandler::selectLanguage(QString language)
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
