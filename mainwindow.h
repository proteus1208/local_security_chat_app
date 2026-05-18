#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include <QSystemTrayIcon>
#include <QMenu>
#include <QAction>

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    void closeEvent(QCloseEvent *);

    // tray icon
    QSystemTrayIcon *m_tray;
    QMenu *m_menu;
    QAction *m_action_show;
    QAction *m_action_close;

    void exit();
};
#endif // MAINWINDOW_H
