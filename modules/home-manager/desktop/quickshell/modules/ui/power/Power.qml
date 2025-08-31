import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io


PanelWindow {
    height: 300
    width: 300
    visible: Vars.visible
    // exclusionMode: ExclusionMode.None
  property bool power: false
  property bool reboot: false

  RowLayout {
    Button {
    text: "Power off"
    onClicked: power = !power
    }
    Button {
      text: "Reboot"
      onClicked: reboot = !reboot
    }
  }

  Process {
    running: power
    command: ["systemctl poweroff"]
  }
    Process {
    running: reboot
    command: ["systemctl reboot"]
  }

}
