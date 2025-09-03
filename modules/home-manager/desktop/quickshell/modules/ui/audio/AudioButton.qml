import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "."


ToolButton {
    id: button
    property var volumeIcon: {
        if (Vars.sink.muted == true) return " " 
        else return " "
    }

    Text {
        anchors.centerIn: parent
        text: volumeIcon
        font.family: Style.fontFamily
        color: Vars.sink.muted ? Style.warning : Style.textPrimary
    }

    onClicked: Vars.toggle()
    background: Rectangle {   
        color: button.hovered ? Style.overlay : "transparent"
        radius: 12
        implicitWidth: 40
        implicitHeight: 40
        anchors.fill: parent
        }
    
    Audio {}
}
