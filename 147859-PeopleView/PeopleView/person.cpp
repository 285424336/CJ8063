#include "person.h"

Person::Person()
{

}

Person::Person(const QString &firstname, const QString &surname) :
    _firstname(firstname), _surname(surname)
{

}

void Person::setFirstName(const QString &firstname)
{
    _firstname = firstname;
}

QString Person::firstName() const
{
    return _firstname;
}

void Person::setSurName(const QString &surname)
{
    _surname = surname;
}

QString Person::surname() const
{
   return _surname;
}

QString Person::name() const
{
    return _firstname+" "+_surname;
}
