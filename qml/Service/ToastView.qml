import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../store"
import "../theme"

Item {
    id: root
    anchors.fill: parent
    z: 99999

    ListView {
        id: listView

        width: 320
        height: parent.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        model: Toast.toasts
        spacing: 10
        interactive: false
        clip: false
        reuseItems: false
        verticalLayoutDirection: ListView.BottomToTop

        delegate: Rectangle {
            id: item

            width: listView.width
            radius: Theme.radiusSize.large
            color: "#d31a282f"

            // Use explicit height, not only implicitHeight
            height: Math.max(45, textItem.implicitHeight) + Theme.sm * 2

            RowLayout {
                anchors.fill: parent
                anchors.margins: Theme.sm
                spacing: Theme.sm

                Image {
                    visible: !!model.icon
                    source: model.icon
                    Layout.preferredWidth: visible ? 45 : 0
                    Layout.preferredHeight: visible ? 45 : 0
                    smooth: true
                }

                Text {
                    id: textItem
                    Layout.fillWidth: true
                    text: (model.title ? "<b>" + model.title + "</b>" : "") + "<p>" + model.text + "</p>"
                    textFormat: Text.RichText
                    wrapMode: Text.Wrap
                    color: Theme.text.primary
                    font.pointSize: Theme.text.small
                }

                Rectangle {
                    width: 20
                    height: 20
                    color: "transparent"
                    Layout.alignment: Qt.AlignTop

                    Text {
                        anchors.centerIn: parent
                        text: "✕"
                        color: "white"
                        font.pointSize: Theme.text.small
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Toast.remove(model.id)
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }

            Timer {
                interval: model.duration
                running: true
                repeat: false
                onTriggered: Toast.remove(model.id)
            }
        }

        add: Transition {
            NumberAnimation {
                property: "x"
                from: listView.width
                to: 0
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        remove: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        displaced: Transition {
            NumberAnimation {
                properties: "y"
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        addDisplaced: Transition {
            NumberAnimation {
                properties: "y"
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
    }
}
