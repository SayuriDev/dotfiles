import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import Quickshell.Widgets
import qs.modules.common

Item {
    id: cpuItem

    property var cpuTempColor: {
        if (ResourceUsage.cpuTemp <= 60)
            cpuTempShape.strokeColor = Style.base07;
        else if (ResourceUsage.cpuTemp <= 85)
            cpuTempShape.strokeColor = Style.warning;
        else if (ResourceUsage.cpuTemp <= 100)
            cpuTempShape.strokeColor = Style.error;
    }

    implicitWidth: 40
    implicitHeight: Style.globalHeight

    Text {
        anchors.centerIn: parent
        text: ResourceUsage.cpuTemp
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
                centerX: cpuItem.width / 2
                centerY: cpuItem.height / 2
                radiusX: (cpuItem.width - 10) / 2
                radiusY: (cpuItem.height - 10) / 2
                startAngle: -90
                sweepAngle: 360
            }

        }

        ShapePath {
            id: cpuTempShape

            strokeWidth: 3
            fillColor: "transparent"

            PathAngleArc {
                centerX: cpuItem.width / 2
                centerY: cpuItem.height / 2
                radiusX: (cpuItem.width - 10) / 2
                radiusY: (cpuItem.height - 10) / 2
                startAngle: -90
                sweepAngle: parseFloat(ResourceUsage.cpuTemp) * 3.6
            }

        }

    }

}
