import QtQuick
import QtQuick.Controls as QQC
import QtQuick.Layouts

import "../Components/Common/Modal"
import "../Components/Common/Avatar"
import "../Components/Common/Input"
import "../Components/Common/Button"
import "../store"

Modal {
    id: root

    show: true
    modalWidth: 420
    modalHeight: 560

    property bool passwordError: false
    property string passwordErrorText: ""

    function selectAvatar() {
        console.log("dummy selectAvatar")
    }

    function updateUserAvatar(avatar) {
        Toast.success("Success", "Your avatar updated")
    }

    function updateUserName(name) {
        Toast.success("Success", "Your username updated")
    }

    function updatePassword(oldPassword, newPassword) {
        Toast.success("Success", "Your password updated")
    }

    content: ColumnLayout {
        width: parent ? parent.width : 0
        spacing: 18

        QQC.Label {
            text: "User info"
            font.pixelSize: 22
            font.bold: true
            Layout.fillWidth: true
        }

        Item {
            Layout.preferredWidth: 96
            Layout.preferredHeight: 96
            Layout.alignment: Qt.AlignHCenter

            Avatar {
                anchors.centerIn: parent
                size: 88
                name: Auth.state.name
                image_base64: Auth.state.avatar
                uuid: Auth.state.uuid
            }

            QQC.RoundButton {
                width: 32
                height: 32
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                text: "📷"
                font.pixelSize: 14
                onClicked: root.selectAvatar()
            }
        }

        Input {
            id: nameInput
            label: "Name"
            text: Auth.state.name
            Layout.fillWidth: true
        }

        Button {
            text: "Update User Name"
            Layout.fillWidth: true
            Layout.preferredHeight: 44

            onClicked: {
                root.updateUserName(text)
            }
        }

        QQC.Label {
            text: "Password"
            font.pixelSize: 16
            font.bold: true
            Layout.fillWidth: true
        }

        Input {
            id: oldPasswordInput
            visible: Auth.state.hasPassword
            label: "Old password"
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }


        Input {
            id: newPasswordInput
            label: "New password"
            echoMode: TextInput.Password
            error: root.passwordError
            errorText: root.passwordErrorText
            Layout.fillWidth: true
        }

        Input {
            id: confirmPasswordInput
            label: "Confirm password"
            echoMode: TextInput.Password
            error: root.passwordError
            errorText: ""
            Layout.fillWidth: true
        }

        Button {
            text: "Update password"
            Layout.fillWidth: true
            Layout.preferredHeight: 44

            onClicked: {
                root.passwordError = false
                root.passwordErrorText = ""

                if (newPasswordInput.text.length === 0) {
                    root.passwordError = true
                    root.passwordErrorText = "Password is required"
                    return
                }

                if (newPasswordInput.text !== confirmPasswordInput.text) {
                    root.passwordError = true
                    root.passwordErrorText = "Password confirmation does not match"
                    return
                }

                root.updatePassword(
                    Auth.state.hasPassword ? oldPasswordInput.text : "",
                    newPasswordInput.text
                )
            }
        }
    }
}
