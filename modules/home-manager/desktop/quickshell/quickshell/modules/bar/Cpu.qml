import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import qs.modules.common

Item {
    id: root

    readonly property int svgSize: 20
    property var cpuUsageColor: {
        if (cpu <= 60)
            cpuUsageShape.strokeColor = Style.base07;
        else if (cpu <= 85)
            cpuUsageShape.strokeColor = Style.warning;
        else if (cpu <= 100)
            cpuUsageShape.strokeColor = Style.error;
    }
    property var cpu: ResourceUsage.cpuUsage

    implicitWidth: 40
    implicitHeight: Style.globalHeight

    IconImage {
        id: cpuSvg

        anchors.centerIn: parent
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/icons/cpu.svg`)
        implicitSize: svgSize
        visible: false
    }

    ToolButton {
        id: button

        anchors.fill: parent
        onClicked: console.log(cpu)

        MultiEffect {
            anchors.centerIn: parent
            visible: cpuSvg
            source: cpuSvg
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
                id: cpuUsageShape

                strokeWidth: 3
                fillColor: "transparent"

                PathAngleArc {
                    centerX: root.width / 2
                    centerY: root.height / 2
                    radiusX: (root.width - 10) / 2
                    radiusY: (root.height - 10) / 2
                    startAngle: -90
                    sweepAngle: parseFloat(root.cpu) / 100 * 360
                }

            }

        }

        background: Rectangle {
            id: backgroundRect

            anchors.fill: parent
            color: button.hovered ? Style.overlay : "transparent"
            radius: Style.globalRadius
        }

    }

}
