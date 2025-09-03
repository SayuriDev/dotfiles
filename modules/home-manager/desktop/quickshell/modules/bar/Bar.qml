import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import "../ui/audio/"
import "../ui/power/"


Scope {
    PanelWindow {
        id: leftpanel
        screen: Quickshell.screens
        anchors.left: true
        anchors.top: true
        anchors.bottom: true
        implicitWidth: 50

        Rectangle {

            anchors.fill: parent
            color: Style.crust

            // Rectangle {
            //     id: leftborder
            //     anchors.top: parent.top
            //     anchors.right: parent.right
            //     anchors.bottom: parent.bottom
            //     width: 5
            //     color: Style.border
            //     implicitHeight: parent.height - toppanel.height
            // }
        }

        ColumnLayout {
            anchors.fill: parent
            // anchors.leftMargin: leftborder.width / 2
            // anchors.rightMargin: leftborder.implicitWidth
            spacing: 5

            Item { Layout.fillHeight: true }
            Workspaces { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
            Item { Layout.fillHeight: true }
            
            ColumnLayout {   
                Layout.alignment: Qt.AlignHCenter 
                Layout.bottomMargin: 8

                Rectangle { anchors.fill: parent; color: Style.surface; radius: 10; }

                Tray { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
                // AudioButton { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.bottomMargin: 6 }
                }
        }
    }

    PanelWindow {
        id: toppanel
        screen: Quickshell.screens
        anchors.left: true
        anchors.right: true
        anchors.top: true
        implicitHeight: 40

        Rectangle {
            anchors.fill: parent
            color: Style.crust

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

        RowLayout {

            anchors.fill: parent
            spacing: 5
            anchors.topMargin: topborder.height
            anchors.bottomMargin: topborder.height * 2

            Mpris { Layout.alignment: Qt.AlignHCenter; Layout.leftMargin: 5 }
            Ram { Layout.alignment: Qt.AlignHCenter; }
            Item { Layout.fillWidth: true }
            Item { Layout.fillWidth: true }
            Clock { Layout.alignment: Qt.AlignHCenter; }
            Item { Layout.fillWidth: true }
            Item { Layout.fillWidth: true }
            AudioButton { Layout.alignment: Qt.AlignHCenter; }
            Item { Layout.fillWidth: true }
            Cpu {}
            PowerButton { Layout.alignment: Qt.AlignHCenter; Layout.rightMargin: 5 }
        }
    }
}