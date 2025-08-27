import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

Item {
    id: root

    ToolButton {
        text: "⏻"
        anchors.centerIn: parent
        scale: 1.8
        onClicked: Vars.toggle()
        background:  Rectangle { color: "transparent" }
    }

}
