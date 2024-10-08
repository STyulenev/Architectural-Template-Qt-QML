#include <QQmlApplicationEngine>

#include "Application.h"

auto main(int argc, char* argv[]) -> int
{
    ATQQ::Core::Application app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/qml");
    engine.addImportPath("qrc:/qml/Styles");
    engine.addImportPath("qrc:/qml/UILibrary");

    app.setEngine(&engine);
    app.launch();

    QObject::connect(&engine, &QQmlApplicationEngine::quit, &QGuiApplication::quit);

    const QUrl url("qrc:/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
