#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    ui->quickWidget->setSource(QUrl("qrc:/qml/Main.qml"));

    m_action_show = new QAction("show", this);
    connect(m_action_show, &QAction::triggered, [this]{
        this->show();
    });

    m_action_close = new QAction("close", this);
    connect(m_action_close, &QAction::triggered, [this]{
        this->exit();
    });

    m_menu = new QMenu(this);
    m_menu->addAction(m_action_show);
    m_menu->addAction(m_action_close);

    m_tray = new QSystemTrayIcon(this);
    m_tray->setIcon(QIcon(":/qml/assets/logo/logo.ico"));
    m_tray->setContextMenu(m_menu);
    m_tray->show();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::closeEvent(QCloseEvent *e)
{
    hide();
    // e->ignore();
}

void MainWindow::exit()
{
    qApp->exit();
}
