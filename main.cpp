#include "RadioInstance.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

QObject* instance(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    return RadioInstance::getInstance();
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //    QQmlApplicationEngine engine;
    //    engine.load(QUrl(QStringLiteral("qrc:/Qmls/Qmls/MainWindow.qml")));

    QQuickView mainWindow;

    qmlRegisterSingletonType<RadioInstance>("Radio.Instance.RadioInstance", 1, 0, "RadioInstance", instance);
    mainWindow.setSource(QUrl("qrc:/Qmls/Qmls/MainWindow.qml"));
    if (QQuickView::Ready == mainWindow.status()) {
        mainWindow.setFlags(Qt::FramelessWindowHint);
        mainWindow.setGeometry(0, 0, 800, 480);
        mainWindow.show();
    }

    return app.exec();
}
