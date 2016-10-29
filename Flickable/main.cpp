#include "Flickable.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Flickable flickable;
    flickable.setGeometry(0, 0, 400, 400);
    flickable.show();

    return app.exec();
}
