//@ pragma UseQApplication

import QtQuick
import Quickshell
import "./modules/bar/"


ShellRoot {
    id: rootShell
    Loader {
        active: true
        sourceComponent: Bar {}
    }

}