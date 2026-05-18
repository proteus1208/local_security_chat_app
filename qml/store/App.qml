pragma Singleton
import QtQuick

QtObject {
    property string currentPage: ""

    function navigate(newUser) {
        currentPage = newUser;
    }
}
