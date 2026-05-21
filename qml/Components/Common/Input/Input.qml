import QtQuick
import QtQuick.Controls as QQC

import "../../../theme"

Item {
    id: root

    property alias text: input.text
    property alias echoMode: input.echoMode
    property string label: ""
    property string errorText: ""

    property bool error: false
    property bool disabled: false

    property color normalColor: "#9e9e9e"
    property color focusColor: "#1976d2"
    property color errorColor: "#d32f2f"
    property color disabledColor: "#bdbdbd"
    property color textColor: "#212121"

    signal accepted()
    signal editingFinished()

    implicitWidth: 280
    implicitHeight: errorText.length > 0 ? 66 : 48

    readonly property bool active: input.activeFocus || input.text.length > 0
    readonly property color activeColor: error ? errorColor : focusColor

    QQC.TextField {
        id: input

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 38

        enabled: !root.disabled

        color: root.disabled ? root.disabledColor : root.textColor
        font.pixelSize: Theme.text.normal

        topPadding: 16
        leftPadding: 0
        rightPadding: 0
        bottomPadding: 6

        background: Rectangle {
            color: "transparent"
        }

        onAccepted: root.accepted()
        onEditingFinished: root.editingFinished()
    }

    Text {
        id: floatingLabel

        text: root.label

        x: 0
        y: root.active ? 0 : 18

        color: {
            if (root.disabled)
                return root.disabledColor
            if (root.error)
                return root.errorColor
            if (input.activeFocus)
                return root.focusColor
            return root.normalColor
        }

        font.pixelSize: root.active ? Theme.text.small : Theme.text.normal

        Behavior on y {
            NumberAnimation { duration: 140; easing.type: Easing.OutCubic }
        }

        Behavior on font.pixelSize {
            NumberAnimation { duration: 140; easing.type: Easing.OutCubic }
        }

        Behavior on color {
            ColorAnimation { duration: 140 }
        }
    }

    Rectangle {
        id: bottomLine

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: input.bottom

        height: 1
        color: root.disabled ? root.disabledColor : root.normalColor
    }

    Rectangle {
        id: activeLine

        width: input.activeFocus || root.error ? parent.width : 0
        height: 2

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: input.bottom

        color: root.activeColor

        Behavior on width {
            NumberAnimation { duration: 180; easing.type: Easing.OutCubic }
        }

        Behavior on color {
            ColorAnimation { duration: 140 }
        }
    }

    Text {
        id: helperText

        visible: root.error && root.errorText.length > 0

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: bottomLine.bottom
        anchors.topMargin: Theme.xs

        text: root.errorText
        color: root.errorColor
        font.pixelSize: Theme.text.normal
        elide: Text.ElideRight
    }
}
