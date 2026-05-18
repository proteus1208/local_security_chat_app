pragma Singleton
import QtQuick

QtObject {

    // spacing
    property int xs: 4
    property int sm: 8
    property int md: 16
    property int lg: 24
    property int xl: 32

    // Base
    property var layout: QtObject {
        property color bgMain: "#F5F7FB"
        property color bgSidebar: "#FFFFFF"
        property color bgContent: "#FFFFFF"
        property color bgHeader: "#FFFFFF"
        property color bgFooter: "#FFFFFF"

        property color border: "#D9DEE8"

        property var menu: QtObject {
            property color activeColor: "#2E68D5"
        }
    }

    property var text: QtObject {
        property color primary: "#1F2937"
        property color secondary: "#6B7280"
        property color white: "#FFFFFF"

        property int small: 12
        property int normal: 14
        property int large: 18
    }

    property var radiusSize: QtObject {
        property int small: 4
        property int normal: 8
        property int large: 12
    }
}