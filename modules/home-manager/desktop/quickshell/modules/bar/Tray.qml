import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell
import "."

ColumnLayout {
    spacing: 5
    Layout.alignment: Qt.AlignHCenter
    
    Repeater {
        model: SystemTray.items
        delegate: Item {
            width: 40
            height: 40

            Rectangle {
                id: rect
                anchors.fill: parent
                radius: 12
                color: button.hovered ? Style.overlay : "transparent"

                ToolButton {
                    id: button
                    anchors.fill: parent
                    icon.source: modelData.icon
                    background: null

                    QsMenuAnchor {
                        id: menuAnchor
                        anchor.window: leftpanel
                        anchor.item: rect
                        menu: modelData.menu
                    }

                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton | Qt.LeftButton
                        onClicked: (mouse) => {
                            if (mouse.button === Qt.RightButton) {
                                if (menuAnchor.menu) menuAnchor.open()
                            } else {
                                modelData.activate()
                            }
                        }
                    }
                }
            }
        }
    }
}
