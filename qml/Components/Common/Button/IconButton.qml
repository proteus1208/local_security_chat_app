import QtQuick
import QtQuick.Controls
import "../../../theme"

Rectangle {
    id: root

    property int size: Theme.lg * 2
    property string iconSource: ""
    property int badge: 0

    signal clicked()

    width: size
    height: size
    radius: size / 2


    color: "transparent"

    Image {
        anchors.centerIn: parent
        width: size
        height: size
        source: root.iconSource
    }

    Rectangle {
        visible: badge > 0
        width: Math.max(badgeText.height, badgeText.width + 5)
        height: badgeText.height
        radius: height / 2
        color: "red"

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: -2
        anchors.topMargin: -2

        Text {
            id: badgeText
            anchors.centerIn: parent
            text: badge > 9 ? "+9" : badge
            font.pixelSize: Theme.text.small
            color: "white"
            renderType: Text.NativeRendering
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
        cursorShape: Qt.PointingHandCursor
    }
}
