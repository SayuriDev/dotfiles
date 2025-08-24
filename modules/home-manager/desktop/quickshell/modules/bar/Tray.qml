import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell

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
                color: "black"
                border.color: "transparent"
                radius: 4
            }

            ToolButton {
                anchors.fill: parent
                icon.source: modelData.icon

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
                        if (mouse.button == Qt.RightButton) {
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
