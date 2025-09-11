import QtQuick
import Quickshell
pragma Singleton

Singleton {
    id: root

    property string assetsPath: Quickshell.shellPath("assets")
}
