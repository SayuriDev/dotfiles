//@ pragma UseQApplication

import "./modules/common/"
import "./modules/bar/"

import QtQuick
import Quickshell

ShellRoot {
    id: rootShell

    Loader {
        id: barLoader
        active: true
        sourceComponent: Bar { }
    }
}
