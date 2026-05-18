import QtQuick
import QtQuick.Controls
import "../../Components/Common/Button"
import "../../Components/Common/Avatar"
import "../../theme"
import "../../store"

Rectangle {
    id: root
    property int itemHeight: 40
    property int width_Collapsed: itemHeight + Theme.sm * 2 + 2
    property string currentPage: App.currentPage

    property var menuItems: [
        {
            pageName: "Home",
            icon: "../../assets/icons/home.png"
        },
        ...Array.from({
            length: 20
        }, (_, index) => ({
                    pageName: "Item " + index,
                    icon: "../../assets/icons/bell.png"
                })),
        {
            pageName: "Settings",
            icon: "../../assets/icons/setting.png"
        }
    ]

    width: width_Collapsed
    // clip: true
    radius: Theme.radiusSize.large

    color: Theme.layout.bgSidebar
    border.color: Theme.layout.border
    border.width: 1

    IconButton {
        id: chatIcon
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: Theme.sm
        iconSource: "../../../assets/icons/chat.png"
        size: itemHeight - Theme.xs * 2
        badge: 2
    }

    Rectangle {
        anchors.top: listContainer.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: -2
        height: 1
        width: itemHeight
        color: Theme.layout.border
    }

    Item {
        id: listContainer
        anchors.centerIn: parent
        width: parent.width - 2
        height: parent.height - 2 - 2 * (itemHeight + Theme.sm)
        clip: true
        ListView {
            id: list
            model: menuItems
            anchors.fill: parent
            spacing: Theme.xs
            topMargin: Theme.sm
            bottomMargin: Theme.sm
            leftMargin: Theme.sm
            rightMargin: Theme.sm
            clip: true
            delegate: Avatar {
                id: control
                width: parent ? parent.width : 0
                height: root.itemHeight
                
            }
        }
    }

    
    IconButton {
        id: chatAdd
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: Theme.sm
        iconSource: "../../../assets/icons/chat.png"
        size: itemHeight - Theme.xs * 2
        badge: 2
    }

    Rectangle {
        anchors.top: listContainer.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 1
        height: 1
        width: itemHeight
        color: Theme.layout.border
    }
}
