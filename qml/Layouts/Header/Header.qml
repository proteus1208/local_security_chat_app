import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../theme"
import "../../Components/Common/Button"

Rectangle {
    color: Theme.layout.bgHeader
    border.color: Theme.layout.border
    border.width: 1
    RowLayout {
        anchors.fill: parent
        Logo {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            Layout.leftMargin: Theme.sm
        }

        Text {
            color: Theme.text.primary
            text: "SChat"
            font.pointSize: 14
        }

        Item {
            Layout.fillWidth: true
        }

        IconButton {
            // Resolved from IconButton.qml’s location, not Header.qml
            iconSource: "../../../assets/icons/bell.png"
            size: 30
            badge: 156123
            Layout.rightMargin: Theme.sm
        }
    }
}
