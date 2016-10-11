#include "RadioInstance.h"
#include <QDebug>
#include <QTimer>

int RadioInstance::doSomething()
{
    setSomeProperty(5);
    return m_SomeProperty;
}

RadioInstance::RadioInstance(QObject *parent)
    : QObject(parent)
    , m_SomeProperty(0)
{
    //    QTimer *timer = new QTimer(this);
    //    timer->start(500);
    //    connect(timer, &QTimer::timeout,
    //            [=]{
    //        int val = someProperty();
    //        setSomeProperty(++val);
    //    });
}

RadioInstance::~RadioInstance()
{
    qDebug() << "RadioInstance::~RadioInstance";
}

RadioInstance* RadioInstance::getInstance()
{
    static RadioInstance *radioInstance = nullptr;
    if (nullptr == radioInstance) {
        radioInstance = new RadioInstance();
    }
    return radioInstance;
}

int RadioInstance::someProperty() const
{
    return m_SomeProperty;
}

void RadioInstance::setSomeProperty(int val)
{
    m_SomeProperty = val;
    emit somePropertyChanged(val);
}

