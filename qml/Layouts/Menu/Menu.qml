import QtQuick
import QtQuick.Controls
import "../../theme"
import "../../store"

Rectangle {
    id: root
    property int itemHeight: 40
    property int width_Collapsed: itemHeight + Theme.sm * 2 + 2
    property int min_width_Expanded: 120
    property bool isExpanded: true
    property int current_width: isExpanded ? min_width_Expanded * 2 : width_Collapsed
    property string currentPage: App.currentPage

    property var menuItems: [
        {
            pageName: "Home",
            icon: "../../assets/icons/home.png"
        },
        {
            pageName: "Add User",
            icon: "../../assets/icons/home.png"
        },
        ...Array.from({
            length: 5
        }, (_, index) => ({
                    pageName: "User " + index,
                    icon: "../../assets/icons/bell.png"
                })),
        {
            pageName: "Settings",
            icon: "../../assets/icons/setting.png"
        }
    ]

    width: current_width
    clip: true
    radius: Theme.radiusSize.large

    color: Theme.layout.bgSidebar
    border.color: Theme.layout.border
    border.width: 1

    Item {
        anchors.centerIn: parent
        width: parent.width - 2
        height: parent.height - 2
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
            delegate: Rectangle {
                id: control
                width: parent? parent.width : 0
                height: root.itemHeight
                color: mouseArea.pressed ? '#3f69ff' : currentPage == modelData.pageName ? Theme.layout.menu.activeColor : mouseArea.containsMouse ? '#2fffffff' : "transparent"
                radius: Theme.radiusSize.normal
                Row {
                    padding: Theme.xs
                    spacing: Theme.xs
                    Image {
                        width: control.height - Theme.xs * 2
                        height: control.height - Theme.xs * 2
                        source: modelData.icon
                    }

                    Text {
                        visible: root.isExpanded
                        color: Theme.text.primary
                        anchors.verticalCenter: parent.verticalCenter
                        text: modelData.pageName
                        font.pointSize: Theme.text.normal
                        width: control.width - root.itemHeight
                        elide: Text.ElideRight
                        // maximumLineCount: 1
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: mouse => {
                        App.navigate(modelData.pageName);
                    }
                }
            }

        }
    }

    Rectangle {
        width: 1
        color: mouseArea.pressed ? '#44ffffff' : "transparent"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Theme.sm
        anchors.bottomMargin: Theme.sm
    }

    MouseArea {
        id: mouseArea

        width: 3
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Theme.sm
        anchors.bottomMargin: Theme.sm

        cursorShape: Qt.SizeHorCursor

        onPositionChanged: mouse => {
            if (current_width + mouse.x > min_width_Expanded) {
                root.isExpanded = true;
                root.current_width = current_width + mouse.x;
            } else {
                root.isExpanded = false;
                root.current_width = width_Collapsed;
            }
        }
    }
}
