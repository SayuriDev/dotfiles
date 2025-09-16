import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import qs.modules.common

Scope {
    // PanelWindow {
    //     id: leftpanel
    //     screen: Quickshell.screens
    //     anchors.left: true
    //     anchors.top: true
    //     anchors.bottom: true
    //     implicitWidth: 50

    //     Rectangle {
    //         anchors.fill: parent
    //         color: Style.crust

    //         // Rectangle {
    //         //     id: leftborder
    //         //     anchors.top: parent.top
    //         //     anchors.right: parent.right
    //         //     anchors.bottom: parent.bottom
    //         //     width: 5
    //         //     color: Style.border
    //         //     implicitHeight: parent.height - toppanel.height
    //         // }
    //     }

    //     ColumnLayout {
    //         anchors.fill: parent
    //         // anchors.leftMargin: leftborder.width / 2
    //         // anchors.rightMargin: leftborder.implicitWidth
    //         spacing: 5

    //         Item { Layout.fillHeight: true }
    //         Workspaces { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
    //         Item { Layout.fillHeight: true }
            
    //         ColumnLayout {   
    //             Layout.alignment: Qt.AlignHCenter 
    //             Layout.bottomMargin: 8

    //             Rectangle { anchors.fill: parent; color: Style.surface; radius: 10; }

    //             Tray { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
    //             // AudioButton { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.bottomMargin: 6 }
    //             }
    //     }
    // }

    PanelWindow {
        id: toppanel
        screen: Quickshell.screens
        anchors.left: true
        anchors.right: true
        anchors.top: true
        implicitHeight: 50

        Rectangle {
            anchors.fill: parent
            color: Style.background

            // Rectangle {
            //     id: topborder
            //     // anchors.left: parent.left
            //     anchors.right: parent.right
            //     anchors.bottom: parent.bottom
            //     height: 3
            //     color: Style.border
            //     implicitWidth: parent.width - leftpanel.width
            // }
        }

        Item {
            anchors.fill: parent

            RowLayout {
                id: leftlayout
                anchors.fill: parent
                spacing: 0
                Clock {}
            }

            Workspaces { anchors.centerIn: parent }

            RowLayout {
                id: rightlayout
                anchors.fill: parent
                spacing: 0
                Item { Layout.fillWidth: true }
                Cpu {}
                CpuTemp {}
                Ram {}
                Item { Layout.preferredWidth: 5 }
                Audio {}
                Tray { Layout.rightMargin: 5 }
                // Mpris { Layout.alignment: Qt.AlignHCenter; Layout.leftMargin: 5 }
                // Item { Layout.fillWidth: true }
                // Item { Layout.fillWidth: true }
                // Power { Layout.alignment: Qt.AlignHCenter; Layout.rightMargin: 5 }
            }
        }
    }
}