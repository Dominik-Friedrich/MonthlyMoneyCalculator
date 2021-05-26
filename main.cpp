#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QTranslator>
#include <QFontDatabase>
#include <QQmlContext>
#include <QIcon>
#include "translationhandler.h"
#include "mysettings.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/appicon.png"));
    app.setOrganizationDomain("http://www.momeistgomeabernurwennerhdist.com/");
 #ifdef QT_DEBUG
    app.setOrganizationName("SemomeSoftware");
    app.setApplicationName("Monthly Money Calculator");

    MySettings mySettings("MonthlyMoneyCalculator.ini" ,QSettings::IniFormat);
 #else
    MySettings mySettings(QSettings::IniFormat, QSettings::Scope::UserScope, "SemomeSoftware", "MonthlyMoneyCalculator");
#endif
    qDebug() << mySettings.fileName();

    int fontID = QFontDatabase::addApplicationFont(":/Open_Sans/OpenSans-Regular.ttf");
    QString family = QFontDatabase::applicationFontFamilies(fontID).at(0);
    QFont googleFont(family);
    app.setFont(googleFont);

    QQmlApplicationEngine engine;
    TranslationHandler transHndl(&engine);
    engine.rootContext()->setContextProperty("translationHandler", &transHndl);
    engine.rootContext()->setContextProperty("mySettings", &mySettings);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
