import QtQuick
import QtQuick.Controls
import "../../../theme"

Item {
    id: root

    property int size: 32
    property string image_base64: ""
    property string name: ""
    property string uuid: ""
    property var live: null

    width: size
    height: size

    function hashCode(str) {
        var h = 2166136261

        for (var i = 0; i < str.length; i++) {
            h ^= str.charCodeAt(i)
            h += (h << 1) + (h << 4) + (h << 7) + (h << 8) + (h << 24)
        }

        return h >>> 0
    }

    function avatarColor() {
        var key = uuid.length > 0 ? uuid : name
        var hue = hashCode(key) % 360
        return Qt.hsla(hue / 360, 0.55, 0.55, 1)
    }

    Rectangle {
        id: wrapper
        anchors.fill: parent
        radius: width / 2
        color: avatarColor()
        clip: true

        Image {
            anchors.fill: parent
            visible: image_base64 !== ""
            source: image_base64 !== "" ? "data:image/png;base64," + image_base64 : ""
            fillMode: Image.PreserveAspectCrop
            smooth: true
            mipmap: true
        }

        Text {
            anchors.centerIn: parent
            visible: image_base64 === ""
            text: name.length > 0 ? name[0].toUpperCase() : "?"
            color: "white"
            font.bold: true
            font.pixelSize: root.size * 0.43
        }
    }

    Rectangle {
        id: liveDot
        width: root.size * 0.28
        height: width
        radius: width / 2
        visible: live !== null

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        color: live ? "#22C55E" : "#EF4444"
        border.color: "white"
        border.width: 2
    }
}
