import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs.modules.common
import Quickshell.Widgets
import QtQuick.Effects

Item {
    implicitWidth: backgroundRect.width
    implicitHeight: backgroundRect.height
    // margin: 10
    readonly property double svgSize: 23

    property var volumeIcon: {
        if (sink.muted == true) volImage.source = speaker_mute 
        else if (sink.volume <= 0.6) volImage.source = speaker
        else if (sink.volume <= 5) volImage.source = speaker_high
        else ""
    }

    IconImage {
        id: speaker_high
        anchors.centerIn: parent
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/icons/speaker_high.svg`)
        implicitSize: svgSize
        visible: false
    }
    IconImage {
        id: speaker
        anchors.centerIn: parent
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/icons/speaker.svg`)
        implicitSize: svgSize
        visible: false
    }
    IconImage {
        id: speaker_mute
        anchors.centerIn: parent
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/icons/speaker_mute.svg`)
        implicitSize: svgSize
        visible: false
    }
    IconImage {
        id: mic_mute
        anchors.centerIn: parent
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/icons/mic_mute.svg`)
        implicitSize: svgSize
        visible: false
    }

    ToolButton {
        id: button
        anchors.centerIn: parent
        RowLayout {
            anchors.fill: parent
            MultiEffect {
                id: volImage
                // source:  ! managed by volumeIcon !
                colorization: 1
                brightness: 1
                colorizationColor: Style.textPrimary
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: svgSize
                Layout.preferredHeight: svgSize
            }
            MultiEffect {
                visible: micMuted
                id: micImage
                Layout.alignment: Qt.AlignHCenter
                source: mic_mute
                colorization: 1
                brightness: 1
                colorizationColor: Style.warning
                Layout.preferredWidth: svgSize / 1.05
                Layout.preferredHeight: svgSize / 1.05
            }
        }
        onClicked: console.log(micMuted)
        background: Rectangle {
            id: backgroundRect
            anchors.fill: parent
            implicitWidth: micImage.visible ? micImage.Layout.preferredWidth + volImage.Layout.preferredWidth + 15 : volImage.Layout.preferredWidth + 15
            implicitHeight: Style.globalHeight
            color: button.hovered ? Style.overlay : "transparent"
            radius: Style.globalRadius
            }
    }
    PwObjectTracker { objects: [ Pipewire.defaultAudioSink, Pipewire.defaultAudioSource ] }
    property bool micMuted: Pipewire.defaultAudioSource.audio.muted
    property var sink: Pipewire.defaultAudioSink.audio
}
