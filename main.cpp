#include "mainwindow.h"

#include <QApplication>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QQuickStyle::setStyle("Fusion");
    MainWindow w;
    w.setWindowIcon(QIcon("qml/assets/logo/logo.ico"));
    w.setWindowTitle("SChat");
    w.show();
    return a.exec();
}
