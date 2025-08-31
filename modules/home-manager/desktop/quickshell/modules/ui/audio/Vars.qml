pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire


Singleton {
    id: root
    property bool visible: false
    function toggle() {
        visible = !visible
    }

    PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }
    property var sink: Pipewire.defaultAudioSink.audio
}
