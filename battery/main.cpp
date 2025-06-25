#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "battery.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Battery>("MyBattery", 1, 0, "Battery");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("battery", "BatteryWidget");

    return app.exec();
}
