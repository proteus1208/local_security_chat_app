pragma Singleton
import QtQuick

QtObject {
    property string currentPage: ""
    property bool userInfoEditModal_show: false

    function navigate(newUser) {
        currentPage = newUser;
    }

    function openUserInfoEditModal(open){
        userInfoEditModal_show = open
    }
}
