pragma Singleton
import QtQuick
import Quickshell


Singleton {
    id: root
    property bool visible: false
    function toggle() {
        visible = !visible
    }
}
