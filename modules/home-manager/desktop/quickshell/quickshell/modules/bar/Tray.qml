import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import qs.modules.common

RowLayout {
    spacing: 5
    Layout.alignment: Qt.AlignHCenter

    Item { // ! Do not remove ! Required to prevent shifting of the bar when there are no icons
        Layout.preferredWidth: 1
        Layout.preferredHeight: 1
    }

    Repeater {
        model: SystemTray.items

        delegate: Item {
            width: 40
            height: Style.globalHeight

            Rectangle {
                id: rect

                anchors.fill: parent
                radius: Style.globalRadius
                color: button.hovered ? Style.overlay : "transparent"

                ToolButton {
                    id: button

                    anchors.fill: parent
                    background: null

                    Image {
                        anchors.centerIn: parent
                        source: modelData.icon
                        width: parent.width * 0.5
                        height: parent.height * 0.5
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
                                if (menuAnchor.menu)
                                    menuAnchor.open();

                            } else {
                                modelData.activate();
                            }
                        }
                    }

                }

            }

        }

    }

}
