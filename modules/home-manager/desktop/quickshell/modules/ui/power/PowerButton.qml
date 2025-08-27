import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower



Window {
    height: 300
    width: 300
    visible: false
    // exclusionMode: ExclusionMode.None
    

  Button {
  icon.name: "battery"

  // kliknięcie zmienia profil
  onClicked: PowerProfiles.profile = PowerProfiles.PowerSaver
  }
// Keys.onPressed: {
//         if (Vars.visible && event.key === Qt.Key_Escape) {
//             Vars.visible = false
//             console.log("escape pressed")
//             event.accepted = true
//         }
// }

}
