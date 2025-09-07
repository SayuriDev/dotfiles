import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.modules.common


RowLayout {
    property var workspaces: Hyprland.workspaces

    property var kanji: {
        1: "一",
        2: "二",
        3: "三",
        4: "四",
        5: "五",
        6: "六",
        7: "七",
        8: "八",
        9: "九",
        10: "十"
    }

    Repeater {
        model: workspaces
        delegate: Button {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            font.pixelSize: 16
            onClicked: modelData.activate()
            background: Rectangle {
                color: "transparent"
                // color: hovered ? Style.surface : "transparent"
                // radius: 8
            }

            Text { 
                anchors.centerIn: parent
                text: kanji[modelData.id] || modelData.id.toString ()
                color: Style.textPrimary
                font.family: Style.fontFamily
                font.bold: true
                }
        }
    }
}
