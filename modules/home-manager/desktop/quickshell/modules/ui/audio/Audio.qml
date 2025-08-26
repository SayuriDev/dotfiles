import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

PanelWindow {
    height: 300
    width: 300
    visible: Vars.popupVisible
    exclusionMode: ExclusionMode.None

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }

        Button {
            text: "🔊"
            onClicked: {
                var sink = Pipewire.defaultAudioSink.audio
                if (sink) {
                    sink.volume = sink.volume > 0 ? 0 : 0.3
                    volumeSlider.value = sink.volume
                }
            }
        }

        Slider {
            id: volumeSlider
            from: 0
            to: 1
            value: !Pipewire.defaultAudioSink.audio.muted ? Pipewire.defaultAudioSink.audio.volume : 0
            width: 120
            onMoved: {
                var sink = Pipewire.defaultAudioSink.audio
                if (sink) sink.volume = value
            }
        }
    }
}
