#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QTranslator>
#include <QFontDatabase>
#include <QQmlContext>
#include "translationhandler.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    app.setOrganizationName("Semome");
    app.setOrganizationDomain("http://www.momeistgomeabernurwennerhdist.com/");
    app.setApplicationName("Monthly Money Calculator");

    int fontID = QFontDatabase::addApplicationFont(":/Open_Sans/OpenSans-Regular.ttf");
    QString family = QFontDatabase::applicationFontFamilies(fontID).at(0);
    QFont googleFont(family);
    app.setFont(googleFont);


    /*
    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "MonthlyMoneyCalculator_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }
    */
    QQmlApplicationEngine engine;
    TranslationHandler transHndl(&engine);
    engine.rootContext()->setContextProperty("translationHandler", &transHndl);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
