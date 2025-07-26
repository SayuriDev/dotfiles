import QtQuick 2.15
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: panel

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 44
    margins {
        top: 0
        left: 0
        right: 0
    }

    Rectangle {
        id: bar
        anchors.fill: parent
        color: "#1a1a1a"
        radius: 0 // 15 (rounded corners)
        border.color: "#333333"
        border.width: 3

        Row {
            id: workspacesRow
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 20
            }
            spacing: 10

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    width: 36
                    height: 28
                    radius: 14
                    color: modelData.active ? "#4caf50" : (mouseArea.containsMouse ? "#444b5a" : "#2c313c")
                    border.color: modelData.active ? "#81c784" : "#444b5a"
                    border.width: modelData.active ? 3 : 2

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: Hyprland.dispatch("workspace " + modelData.id)
                    }

                    Text {
                        text: modelData.id
                        anchors.centerIn: parent
                        color: modelData.active ? "#ffffff" : "#b0b8c1"
                        font.pixelSize: 14
                        font.bold: modelData.active
                        font.family: "Inter, sans-serif"
                    }
                }
            }

            Text {
                visible: Hyprland.workspaces.length == 0 
                text: "No workspaces"
                color: "#ffffff"
                font.pixelSize: 13
                font.italic: true
            }
        }

        // Spacer
        Rectangle {
            anchors {
                left: workspacesRow.right
                right: timeDisplay.left
                verticalCenter: parent.verticalCenter
            }
            height: 1
            color: "transparent"
        }

        Text {
            id: timeDisplay
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 20
            }

            property string currentTime: ""

            text: currentTime
            color: "#e0e0e0"
            font.pixelSize: 16
            font.family: "Inter, sans-serif"
            font.bold: true

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    var now = new Date();
                    timeDisplay.currentTime = Qt.formatDateTime(now, "hh:mm:ss  MMM dd");
                }
            }       
        }
    }
}