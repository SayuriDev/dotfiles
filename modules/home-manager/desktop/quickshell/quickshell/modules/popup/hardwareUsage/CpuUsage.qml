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

    property var cpuUsageColor: {
        if (ResourceUsage.cpuUsage <= 60)
            cpuUsageShape.strokeColor = Style.base07;
        else if (ResourceUsage.cpuUsage <= 85)
            cpuUsageShape.strokeColor = Style.warning;
        else if (ResourceUsage.cpuUsage <= 100)
            cpuUsageShape.strokeColor = Style.error;
    }

    implicitWidth: 40
    implicitHeight: Style.globalHeight

    Text {
        anchors.centerIn: parent
        text: ResourceUsage.cpuUsage
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
            id: cpuUsageShape

            strokeWidth: 3
            fillColor: "transparent"

            PathAngleArc {
                centerX: cpuItem.width / 2
                centerY: cpuItem.height / 2
                radiusX: (cpuItem.width - 10) / 2
                radiusY: (cpuItem.height - 10) / 2
                startAngle: -90
                sweepAngle: parseFloat(ResourceUsage.cpuUsage) / 100 * 360
            }

        }

    }

}
