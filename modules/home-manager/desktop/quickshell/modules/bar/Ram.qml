import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import ".."

ToolButton {
    id: root

    // onClicked: Vars.toggle()
    background: Rectangle {   
        color: root.hovered ? Style.overlay : Style.surface
        radius: 12
        implicitWidth: text.paintedWidth + 15
        implicitHeight: 32
        anchors.fill: parent
        }
    Text {
        id: text
        anchors.centerIn: parent
        text: " " + cpu + "%" + " | " + temp + "°C"
        font.family: Style.fontFamily
        font.bold: true
        color: Style.textPrimary
    }

    property var cpuSamples: []
    property string cpu: "?"
    Process {
       id: dateProc
       command: ["/bin/sh", "-c", "top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}'"]
       running: true
       stdout: StdioCollector {
             onStreamFinished: {
                 let value = parseFloat(this.text.trim())
                 if (!isNaN(value)) {
                     if (root.cpuSamples.length >= 5) root.cpuSamples.shift()
                     root.cpuSamples.push(value)
                     let sum = root.cpuSamples.reduce((a, b) => a + b, 0)
                     root.cpu = (sum / root.cpuSamples.length).toFixed(0)
                 }
             }
         }
     }
    property var temp: "?"
    Process {
    id: tempProc
    command: ["/bin/sh", "-c", "cat /sys/class/thermal/thermal_zone1/temp"]
    stdout: StdioCollector {
        onStreamFinished: {
            let value = parseInt(this.text.trim())
            if (!isNaN(value)) {
                root.temp = (value / 1000).toFixed(0)
              }
          }
      }
    }

    Timer {
       interval: 2500
       running: true
       repeat: true
       onTriggered: { dateProc.running = true; tempProc.running = true }
     }


}

