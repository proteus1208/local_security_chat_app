import QtQuick
import QtQuick.Controls
import "../theme"
import "../store"

Rectangle {
    id: root

    property string currentPage: App.currentPage

    color: Theme.layout.bgContent
    border.color: Theme.layout.border
    border.width: 1
    radius: Theme.radiusSize.normal

    function loadCurrentPage() {
        const pageSource = "../Pages/" + currentPage + ".qml"

        loader.source = ""          // clear old source first
        loader.setSource(pageSource)
    }

    onCurrentPageChanged: {
        loadCurrentPage()
    }

    Component.onCompleted: {
        loadCurrentPage()
    }

    Item {
        id: title
        height: 40
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        Text {
            text: currentPage
            font.pointSize: Theme.text.normal
            color: Theme.text.primary
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: Theme.sm
            anchors.left: parent.left
            width: parent.width
            elide: Text.ElideRight
        }
    }

    Rectangle {
        anchors.topMargin: title.height
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: Theme.layout.border
    }

    Item {
        height: parent.height - title.height
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Theme.sm

        Loader {
            id: loader
            anchors.fill: parent

            onStatusChanged: {
                if (status === Loader.Error) {
                    Toast.error("Error", "Can't load current page: " + currentPage)
                }
            }
        }
    }

}