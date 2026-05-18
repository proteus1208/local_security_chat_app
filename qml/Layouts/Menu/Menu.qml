import QtQuick
import QtQuick.Controls
import "../../theme"
import "../../store"
import "../../Components/Common/Avatar"

Rectangle {
    id: root
    property int itemHeight: 40
    property int width_Collapsed: itemHeight + Theme.sm * 2 + 2
    property int min_width_Expanded: 120
    property bool isExpanded: true
    property int current_width: isExpanded ? min_width_Expanded * 2 : width_Collapsed
    property string currentPage: App.currentPage

    property var users: [
        ...Array.from({
            length: 5
        }, (_, index) => ({
                    uuid: "User " + index,
                    name: "User " + index,
                    avatar: "",
                    live: false
                })),
    ]

    width: current_width
    clip: true
    radius: Theme.radiusSize.large

    color: Theme.layout.bgSidebar
    border.color: Theme.layout.border
    border.width: 1

    Item {
        anchors.centerIn: parent
        width: parent.width - 2
        height: parent.height - 2
        clip: true
        ListView {
            id: list
            model: users
            anchors.fill: parent
            spacing: Theme.xs
            topMargin: Theme.sm
            bottomMargin: Theme.sm
            leftMargin: Theme.sm
            rightMargin: Theme.sm
            clip: true
            delegate: Rectangle {
                id: control
                width: parent? parent.width : 0
                height: root.itemHeight
                color: item_mouseArea.pressed ? '#dfdfdf' : currentPage == modelData.uuid ? Theme.layout.menu.activeColor : item_mouseArea.containsMouse ? '#dfdfdf' : "transparent"
                radius: Theme.radiusSize.normal
                Row {
                    padding: Theme.xs
                    spacing: Theme.xs
                    Avatar {
                        uuid: modelData.uuid
                        name: modelData.name
                        live: true
                        image_base64: modelData.avatar
                        size: control.height - Theme.xs * 2
                    }

                    Text {
                        visible: root.isExpanded
                        color: Theme.text.primary
                        anchors.verticalCenter: parent.verticalCenter
                        text: modelData.name
                        font.pointSize: Theme.text.small
                        width: control.width - root.itemHeight
                        elide: Text.ElideRight
                        // maximumLineCount: 1
                    }
                }

                MouseArea {
                    id: item_mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: mouse => {
                        App.navigate(modelData.uuid);
                    }
                }
            }

        }
    }

    Rectangle {
        width: 1
        color: mouseArea.pressed ? '#44ffffff' : "transparent"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Theme.sm
        anchors.bottomMargin: Theme.sm
    }

    MouseArea {
        id: mouseArea

        width: 3
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Theme.sm
        anchors.bottomMargin: Theme.sm

        cursorShape: Qt.SizeHorCursor

        onPositionChanged: mouse => {
            if (current_width + mouse.x > min_width_Expanded) {
                root.isExpanded = true;
                root.current_width = current_width + mouse.x;
            } else {
                root.isExpanded = false;
                root.current_width = width_Collapsed;
            }
        }
    }
}
