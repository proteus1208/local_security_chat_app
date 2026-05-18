#include "mainwindow.h"

#include <QApplication>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QQuickStyle::setStyle("Fusion");
    MainWindow w;
    w.show();
    return a.exec();
}
