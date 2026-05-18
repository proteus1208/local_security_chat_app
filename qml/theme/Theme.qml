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
        property color bgMain: "#14151C"
        property color bgSidebar: "#1C1F28"
        property color bgContent: "#1C1F28"
        property color bgHeader: "#191B24"
        property color bgFooter: "#191B24"

        property color border: '#323542'

        property var menu: QtObject {
            property color activeColor: "#2E68D5"
        }
    }

    // property var color: QtObject {
    //     // Accent
    //     property color accent: "#3b82f6"

    //     // States
    //     property color hoverColor: "#1e3a8a"
    //     property color activeColor: "#2E68D5"

    //     property color primary: "#4CAF50"
    //     property color secondary: "#2196F3"
    //     property color background: "#f5f5f5"

    //     property color border: "#e0e0e0"
    //     property color danger: "#f44336"
    // }

    property var text: QtObject {
        property color primary: "#e5e7eb"
        property color secondary: "#9ca3af"
        property color white: "white"

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
