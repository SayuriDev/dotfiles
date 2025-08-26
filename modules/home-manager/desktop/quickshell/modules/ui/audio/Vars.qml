pragma Singleton
import QtQuick
import Quickshell


Singleton {
    id: root
    property bool popupVisible: false

    function toggle() {
        popupVisible = !popupVisible
    }
}
