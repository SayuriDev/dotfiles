import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import qs.modules.common
import Quickshell.Services.Pipewire

Item {
    id: root
    readonly property int svgSize: 20

    PwObjectTracker { objects: [ Pipewire.defaultAudioSink, Pipewire.defaultAudioSource ] }

    readonly property bool sinkMuted: Pipewire.defaultAudioSink.audio.muted
    readonly property var volume: sinkMuted ? 0 : ( Pipewire.defaultAudioSink.audio.volume * 100 ).toFixed(0)

    property var volumeColor: {
        if (volume <= 100) volumeShape.strokeColor = Style.base07
        else if (volume <= 200) volumeShape.strokeColor = Style.warning
        else volumeShape.strokeColor = style.error
    }

    implicitWidth: implicitHeight
    implicitHeight: Style.globalHeight

    ToolButton {
        id: button
        anchors.fill: parent
        onClicked: console.log(volume)

        background: Rectangle {
            id: backgroundRect
            anchors.fill: parent
            color: button.hovered ? Style.overlay : "transparent"
            radius: Style.globalRadius
        }

        IconImage {
            id: volumeSvg
            anchors.centerIn: parent
            source: sinkMuted ? Qt.resolvedUrl(`${Dirs.assetsPath}/icons/speaker_mute.svg`) : Qt.resolvedUrl(`${Dirs.assetsPath}/icons/speaker.svg`)
            implicitSize: svgSize
            visible: false
        }
        MultiEffect {
            anchors.centerIn: parent
            visible: volumeSvg
            source: volumeSvg
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
                id: volumeShape
                strokeWidth: 3
                // strokeColor: ! managed by volumeColor !
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap
                PathAngleArc {
                    centerX: root.width / 2
                    centerY: root.height / 2
                    radiusX: (root.width - 10) / 2
                    radiusY: (root.height - 10) / 2
                    startAngle: -90
                    sweepAngle: parseFloat(root.volume * 3.6 ) 
                }
            }
        }
    }
}
