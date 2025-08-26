import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import "../ui/audio/"

Scope {
    PanelWindow {
        id: leftpanel
        screen: Quickshell.screens
        anchors.left: true
        anchors.top: true
        anchors.bottom: true
        implicitWidth: 55

        SystemClock {
            id: clock
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 5

            Clock { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
            Item { Layout.fillHeight: true; }
            Workspaces { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
            Item { Layout.fillHeight: true; }
            Tray { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.bottomMargin: 8 }
        }

        // Rectangle { anchors.fill: parent; color: "black";  }
    }


    PanelWindow {
        id: toppanel
        screen: Quickshell.screens
        anchors.left: true
        anchors.right: true
        anchors.top: true
        implicitHeight: 55

        RowLayout {
            anchors.fill: parent
            spacing: 5
            Item { Layout.fillWidth: true }
            Mpris { Layout.alignment: Qt.AlignHCenter }
            Item { Layout.fillWidth: true; }
            AudioButton { Layout.alignment: Qt.AlignHCenter; Layout.rightMargin: 30; }
            // Item { Layout.fillWidth: true; }

        }
    }
}