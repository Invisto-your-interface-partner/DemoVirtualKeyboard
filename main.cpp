#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <keyboardhandler.h>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);


    KeyboardHandler keyboardHandler;
    QQmlContext *rootContext = engine.rootContext();
    rootContext->setContextProperty("KeyboardHandler", &keyboardHandler);
    QObject::connect(&app, &QGuiApplication::focusObjectChanged, &keyboardHandler, &KeyboardHandler::onFocusObjectChanged);

    engine.loadFromModule("/", "Main");

    return app.exec();
}
