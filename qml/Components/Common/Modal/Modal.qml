import QtQuick
import QtQuick.Controls

import "../../../theme"

Rectangle{
    id: root
    property Component content : Item {}
    property bool show: true
    property int modalWidth: 320
    property int modalHeight: 320

    anchors.fill: parent
    color: "#55000000"
    visible: show
    Rectangle{
        id: box
        width: root.modalWidth
        height: root.modalHeight
        color: "white"
        radius: Theme.radiusSize.normal
        anchors.centerIn: root
        Loader{
            id: content_item
            anchors.fill: parent
            anchors.margins: Theme.md
            sourceComponent: content
        }
    }
}
