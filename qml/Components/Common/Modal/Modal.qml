import QtQuick
import QtQuick.Controls

import "../../../theme"

Popup {
    id: root

    property Component content: Item {}
    property bool show: false
    property int modalWidth: 320
    property int modalHeight: 320
    property var background_clicked: () => {}

    modal: true
    focus: true
    padding: 0

    width: parent ? parent.width : 0
    height: parent ? parent.height : 0

    closePolicy: Popup.NoAutoClose

    onShowChanged: {
        if (show)
            open()
        else
            close()
    }

    onOpened: show = true
    onClosed: show = false

    Overlay.modal: Rectangle {
        color: "#55000000"
    }

    background: Rectangle {
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.background_clicked()
            }
        }
    }

    contentItem: Item {
        Rectangle {
            id: box

            width: Math.min(root.modalWidth, root.width * 0.9)
            height: Math.min(root.modalHeight, root.height * 0.9)

            anchors.centerIn: parent

            color: "white"
            radius: Theme.radiusSize.normal
            clip: true

            ScrollView {
                id: scroll

                anchors.fill: parent
                anchors.margins: Theme.md
                clip: true

                Loader {
                    id: contentItemLoader

                    width: scroll.availableWidth
                    sourceComponent: root.content
                }
            }
        }
    }
}
