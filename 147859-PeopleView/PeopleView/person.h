#ifndef PERSON_H
#define PERSON_H

#include <QString>
#include <QMetaType>

class Person
{
public:
    explicit Person();
    Person(const QString &firstname, const QString &surname);
    virtual ~Person() { ; }

    void setFirstName(const QString &firstname);
    QString firstName() const;

    void setSurName(const QString &surname);
    QString surname() const;

    QString name() const;
private:
    long _id;

    QString _firstname;
    QString _surname;
};

Q_DECLARE_METATYPE(Person);

#endif // PERSON_H
