import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import "../.."

ToolButton {
    id: button
    Text { text: "⏻"; anchors.centerIn: parent; font.pixelSize: 32; height: parent.height - 5; color: Style.textPrimary; } 
    onClicked: Vars.toggle()
    background: Rectangle {
        implicitHeight: 40
        implicitWidth: 40
        color: button.hovered ? Style.overlay : Style.surface 
        radius: 10;
        }
    Power {}
}

