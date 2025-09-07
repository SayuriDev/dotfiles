import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import qs.modules.common

ToolButton {
    id: button
    Text { text: "⏻"; anchors.centerIn: parent; font.pixelSize: 32; height: parent.height; color: Style.textPrimary; } 
    onClicked: Vars.toggle()
    background: Rectangle {
        implicitHeight: 32
        implicitWidth: 32
        color: button.hovered ? Style.overlay : Style.surface
        radius: 10;
        }
}

