import QtQuick
import QtQuick.Controls

Rectangle {
    width: 300
    height: 200
    color: "#f5f5f5"

    Flow {
        anchors.fill: parent
        spacing: 8

        Repeater {
            model: ["Tag1", "LongTag2", "Tag3", "QML", "UI"]

            Rectangle {
                height: 30
                width: textItem.implicitWidth + 20
                radius: 6
                color: "#4CAF50"

                Text {
                    id: textItem
                    text: modelData
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }
    }
}