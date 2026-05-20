import QtQuick
import QtQuick.Controls as QQC

QQC.Button {
    id: root

    property color primaryColor: "#1976d2"
    property color disabledColor: "#bdbdbd"
    property color hoverColor: "#1565c0"
    property int radius: 8

    implicitHeight: 44
    implicitWidth: 120

    hoverEnabled: true

    HoverHandler {
        cursorShape: root.enabled
                     ? Qt.PointingHandCursor
                     : Qt.ArrowCursor
    }

    background: Rectangle {
        radius: root.radius

        color: {
            if (!root.enabled)
                return root.disabledColor

            if (root.down)
                return "#0d47a1"

            if (root.hovered)
                return root.hoverColor

            return root.primaryColor
        }
    }

    contentItem: Text {
        text: root.text
        color: "white"

        font.pixelSize: 14
        font.bold: true

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        elide: Text.ElideRight
    }
}
