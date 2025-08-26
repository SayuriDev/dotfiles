import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Item {
    id: root
    // width: 50
    // height: 50

    ToolButton {
        text: "🔊"
        anchors.centerIn: parent
        onClicked: Vars.toggle()
        background:  Rectangle { color: "transparent" }
    }

}
