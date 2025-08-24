import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts

Scope {
    id: root
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
            
            width: parent.width 
            spacing: 50 

            Clock { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
            
            Workspaces { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }

            Tray {  }
  
        }

        // Rectangle { anchors.fill: parent; color: "black";  }
    }
}