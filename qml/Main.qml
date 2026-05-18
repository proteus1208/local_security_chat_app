import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "theme"
import "store"

import "./Layouts"
import "./Layouts/Header"
import "./Layouts/Menu"
import "./Layouts/Chat"
import "./Service"

Rectangle {
    id: root
    anchors.fill: parent
    color: Theme.layout.bgMain
    width: 600
    height: 800

    ColumnLayout {
        anchors.fill: parent
        spacing: Theme.sm

        Header {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
        }

        RowLayout {
            spacing: Theme.sm
            Layout.fillWidth: true
            Layout.fillHeight: true

            Menu {
                id: menu
                Layout.fillHeight: true
                Layout.preferredWidth: menu.width
                Layout.leftMargin: Theme.sm
            }

            Content {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Chat {
                id: chat
                Layout.preferredWidth: chat.width
                Layout.fillHeight: true
                Layout.rightMargin: Theme.sm
            }
        }

        Footer {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
        }
    }

    ToastView {
        anchors.fill: parent
    }

    Item {
        id: popupLayer
        anchors.fill: parent
        // color: "#1a000000"
        // z: 1000
    }
}
