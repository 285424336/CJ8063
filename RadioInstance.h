#ifndef RADIOINSTANCE_H
#define RADIOINSTANCE_H

#include <QObject>

class QQmlEngine;
class QJSEngine;
class RadioInstance : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(int someProperty READ someProperty WRITE setSomeProperty NOTIFY somePropertyChanged)
public:
    explicit RadioInstance(QObject *parent = nullptr);
    ~RadioInstance();
    static RadioInstance* getInstance();
public slots:
    int someProperty() const;
    void setSomeProperty(int val);
    /*Q_INVOKABLE*/ int doSomething();

signals:
    void somePropertyChanged(int newVal);

private:
    int m_SomeProperty;
};

#endif // RADIOINSTANCE_H
