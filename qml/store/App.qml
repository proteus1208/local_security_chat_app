pragma Singleton
import QtQuick

QtObject {
    property string currentPage: "Home"

    function navigate(newPage) {
        currentPage = newPage;
    }
}
