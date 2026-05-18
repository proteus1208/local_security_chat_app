import QtQuick
import QtQuick.Layouts
import "../../Components/Common/Avatar"
import "../../theme"

Rectangle {
    id: userBtn

    readonly property int padding: 4

    width: rowContent.width
    height: 32 + padding * 2

    color: "#eeeeee"
    radius: height / 2

    RowLayout {
        id: rowContent
        anchors.centerIn: parent
        spacing: Theme.sm

        Text {
            id: username
            text: "Demon"
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: Theme.sm
            font.pointSize: Theme.text.small
        }

        Avatar {
            name: "Demon"
            live: true
            image_base64: ""
            size: userBtn.height - padding * 2
            Layout.alignment: Qt.AlignVCenter
            Layout.rightMargin: padding
        }
    }
}
