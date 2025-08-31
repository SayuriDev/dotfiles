import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

PanelWindow {
    id: panel
    height: 300
    width: 300
    visible: Vars.visible
    
    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Button {
            text: "🔊"
            onClicked: {
                var sink = Vars.sink
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
            value: !Vars.sink.muted ? Vars.sink.volume : 0
            width: 120
            onMoved: {
                var sink = Vars.sink
                if (sink) sink.volume = value
            }
        }
    }
}