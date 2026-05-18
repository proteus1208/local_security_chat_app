import QtQuick
import QtQuick.Controls
import "../../../theme"

Item {
    property int size: Theme.size.sm
    property string image_base64: ""
    property string name: ""
    property bool live: false

    width: size
    height: size

    Rectangle {
        width: size
        height: size
        anchors.centerIn: parent.centerIn
        radius: size / 2
        color: red
        
    }
}