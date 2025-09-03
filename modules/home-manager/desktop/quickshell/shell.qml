//@ pragma UseQApplication


import QtQuick
import Quickshell
import "./modules/bar/"
import "./modules/common/"

ShellRoot {
    id: rootShell


    Loader {
        id: barLoader
        active: true
        sourceComponent: Bar { }
    }
}
