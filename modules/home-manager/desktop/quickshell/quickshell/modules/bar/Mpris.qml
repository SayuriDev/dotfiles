import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick.Layouts
import qs.modules.common


RowLayout {
  id: root
  spacing: 8

  property var players: Mpris.players.values.filter(p => {
    return !(p.identity && p.identity.indexOf("firefox") !== -1)
  })
  property MprisPlayer player: players.length ? players[0] : null

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      if (!root.player && root.players.length) root.player = root.players[0]
      else if (root.player && root.players.indexOf(root.player) === -1)
        root.player = root.players[0] ?? null
    }
  }


  Layout.preferredWidth: 500
  Layout.maximumWidth: 500

  // anchors.fill: parent
  ToolButton {
    implicitWidth: layout.width + 25
    implicitHeight: 32
    background:  Rectangle { color: Style.surface; radius: 6 }
    anchors.centerIn: parent.right



    // visible: !!root.player
    enabled: root.player && root.player.canTogglePlaying
    onClicked: root.player.togglePlaying()
  

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: 5

        Text {
          id: icon
          text: root.player && root.player.isPlaying ? " " : " "
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          color: Style.textDisabled
          font.pixelSize: 20
          font.bold: true
          font.family: Style.fontFamily
        }      
        Text {
            id: title
            text: root.player ? (root.player.trackTitle + " -" ||  "") : "No title found"
            font.pixelSize: 15
            elide: Text.ElideRight
            Layout.fillWidth: true
            Layout.maximumWidth: 200
            color: Style.textPrimary
            font.bold: true
            font.family: Style.fontFamily
            }
        Text {
            id: artist
            text: root.player ? (" " + root.player.trackArtist || "") : ""
            font.pixelSize: 15
            elide: Text.ElideRight
            Layout.fillWidth: true
            Layout.maximumWidth: 200
            color: Style.textPrimary
            font.bold: true
            font.family: Style.fontFamily

        }
     }
  }
}