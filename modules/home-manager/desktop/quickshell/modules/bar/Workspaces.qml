import QtQuick 
import QtQuick.Controls 
import QtQuick.Layouts 
import Quickshell.Hyprland

ColumnLayout {
    property var workspaces: Hyprland.workspaces

    Repeater {
        model: workspaces
        delegate: Button {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            font.pixelSize: 16
            onClicked: modelData.activate()
            background: Rectangle {
                // color: modelData.active ? "#4CAF50" : "#222"
                // border.color: modelData.active ? "#A5D6A7" : "#444"
                border.width: 3
                radius: 8
            }
            text: modelData.id.toString()
        }
    }
}
