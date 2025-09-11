pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root

    // --- Base ---
    readonly property color crust: "#11111b"
    readonly property color base00: "#181825"
    readonly property color base01: "#1e1e2e"
    readonly property color base02: "#313244"
    readonly property color base03: "#45475a"
    readonly property color base04: "#585b70"
    readonly property color base05: "#cdd6f4"
    readonly property color base06: "#f5e0dc"
    readonly property color base07: "#b4befe"
    readonly property color base08: "#f38ba8"
    readonly property color base09: "#fab387"
    readonly property color base0A: "#f9e2af"
    readonly property color base0B: "#a6e3a1"
    readonly property color base0C: "#94e2d5"
    readonly property color base0D: "#89b4fa"
    readonly property color base0E: "#cba6f7"
    readonly property color base0F: "#f2cdcd"

    // --- UI ---
    readonly property color background: base00
    readonly property color surface:    base01
    readonly property color overlay:    base02
    readonly property color border:     base03
    readonly property color muted:      base04
    readonly property color foreground: base05

    // --- Accent ---
    readonly property color accent:     base0D 
    readonly property color accentAlt:  base0E
    readonly property color highlight:  base0A

    // --- Status ---
    readonly property color success:    base0B
    readonly property color warning:    base09
    readonly property color error:      base08
    readonly property color info:       base0C

    // --- Text ---
    readonly property color textPrimary:   base05
    readonly property color textSecondary: base04
    readonly property color textDisabled:  base03

    // --- Font ---
    readonly property string fontFamily: "Inter"

    readonly property int globalHeight: 40
    readonly property int globalRadius: 8
}
