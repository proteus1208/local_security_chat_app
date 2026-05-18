import QtQuick
import QtQuick.Controls
import "../theme"

Rectangle {
    color: Theme.layout.bgFooter
    border.color: Theme.layout.border
    border.width: 1

    Text {
        text: "My custom Window"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: Theme.text.primary
        font.pointSize: Theme.text.normal
    }

    // Text {
    //     text: '<a href="mailto:svenandersson0503@gmail.com">svenandersson0503@gmail.com</a>'
    //     textFormat: Text.RichText
    //     anchors.right: parent.right
    //     anchors.rightMargin: 10
    //     anchors.verticalCenter: parent.verticalCenter
    //     color: Theme.text.primary
    //     font.pointSize: Theme.text.normal
    //     onLinkActivated: function (link) {
    //         Qt.openUrlExternally(link);
    //     }
    // }
}
