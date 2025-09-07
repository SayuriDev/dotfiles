import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import qs.modules.common

Item {
    id: root

    readonly property int svgSize: 20
    property int ram

    property var ramUsageColor: {
        if (ram <= 60) ramUsageShape.strokeColor = Style.base07
        else if (ram <= 85) ramUsageShape.strokeColor = Style.warning
        else if (ram <= 100) ramUsageShape.strokeColor = Style.error
    }

    implicitWidth: implicitHeight
    implicitHeight: Style.globalHeight

    ToolButton {
        id: button
        anchors.fill: parent
        onClicked: console.log(ram)

        background: Rectangle {
            id: backgroundRect
            anchors.fill: parent
            color: button.hovered ? Style.overlay : "transparent"
            radius: Style.globalRadius
        }

        IconImage {
            id: ramSvg
            anchors.centerIn: parent
            source: Qt.resolvedUrl(`${Dirs.assetsPath}/icons/ram.svg`)
            implicitSize: svgSize
            visible: false
        }
        MultiEffect {
            anchors.centerIn: parent
            visible: ramSvg
            source: ramSvg
            colorization: 1
            brightness: 1
            colorizationColor: Style.textPrimary
            implicitHeight: svgSize
            implicitWidth: svgSize
        }

        Shape {
            anchors.centerIn: parent
            layer.enabled: true
            layer.smooth: true
            antialiasing: true
            ShapePath {
                strokeWidth: 6
                strokeColor: Style.background
                fillColor: "transparent"
                PathAngleArc {
                    centerX: root.width / 2
                    centerY: root.height / 2
                    radiusX: (root.width - 10) / 2
                    radiusY: (root.height - 10) / 2
                    startAngle: -90
                    sweepAngle: 360
                }
            }
            ShapePath {
                id: ramUsageShape
                strokeWidth: 3
                // strokeColor: ! managed by ramUsageColor !
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap
                PathAngleArc {
                    centerX: root.width / 2
                    centerY: root.height / 2
                    radiusX: (root.width - 10) / 2
                    radiusY: (root.height - 10) / 2
                    startAngle: -90
                    sweepAngle: parseFloat(root.ram * 3.6)
                }
            }
        }
    }

    Process {
        id: usageProc
        command: ["/bin/sh", "-c", "free -m | awk '/Mem:/ { printf(\"%3.0f\", $3/$2*100) }'"]
        stdout: StdioCollector {
            onStreamFinished: {
                let value = parseInt(this.text.trim())
                root.ram = value
            }
        }
    }

    Timer {
        interval: 2500
        running: true
        repeat: true
        onTriggered: {
            usageProc.running = true
        }
    }
}
