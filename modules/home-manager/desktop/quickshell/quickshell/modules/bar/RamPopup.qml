import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick.Layouts
import qs.modules.common


PanelWindow {
    anchors.top: parent.top
    id: root
    implicitWidth: 600
    implicitHeight: 300
    visible: false
    exclusionMode: ExclusionMode.Ignore

    property var currentUsage
    property var maxRam

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: root.width / 3
        Text {
            text: "cpu"
        }
        Text {
            text: "ram"
        }
        Text {
            text: "disk"
        }
    }

    Column { 
        
    }
    Process {
        id: ramProc
        command: ["/bin/sh", "-c", "free -m | awk '/Mem:/ { printf(\"%d %d\", $3, $2) }'"]
        stdout: StdioCollector {
            onStreamFinished: {
                let parts = text.split(" ")
                let usage = parseInt(parts[0])
                let max = parseInt(parts[1])

                root.currentUsage = usage
                root.maxRam = max
            }
        }
    }

    Timer {
        interval: 2500
        running: true
        repeat: true
        onTriggered: {
            ramProc.running = true
        }
    }
}