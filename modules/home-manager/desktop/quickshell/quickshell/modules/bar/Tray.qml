import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell
import qs.modules.common

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
                radius: 8
                color: button.hovered ? Style.overlay : "transparent"

                ToolButton {
                    id: button
                    anchors.fill: parent
                    background: null

                    Image {
                        anchors.centerIn: parent
                        source: modelData.icon
                        width: parent.width * 0.55
                        height: parent.height * 0.55
                        fillMode: Image.PreserveAspectFit
                    }

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
