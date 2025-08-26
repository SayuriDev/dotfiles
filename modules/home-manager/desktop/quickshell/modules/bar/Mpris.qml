import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick.Layouts

RowLayout {
  id: root
  spacing: 8

  property var players: Mpris.players.values.filter(p => {
    return !(p.identity && p.identity.indexOf("firefox") !== -1)
  })
  property MprisPlayer player: players.length ? players[0] : null

  // Aktualizuj player jeśli lista się zmienia
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
    implicitHeight: layout.height + 10
    background:  Rectangle { color: "gray" }
    anchors.centerIn: parent


    // visible: !!root.player
    enabled: root.player && root.player.canTogglePlaying
    onClicked: root.player.togglePlaying()
  

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: 5

        Text {
          id: icon
          text: root.player && root.player.isPlaying ? "" : ""
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
          
        }      
        Text {
            id: title
            text: root.player ? (root.player.trackTitle + " -" ||  "") : "-"
            color: "#aaa"
            font.pixelSize: 15
            elide: Text.ElideRight
            Layout.fillWidth: true
            Layout.maximumWidth: 200
        }
        Text {
            id: artist
            text: root.player ? (root.player.trackArtist || "") : ""
            color: "#aaa"
            font.pixelSize: 15
            elide: Text.ElideRight
            Layout.fillWidth: true
            Layout.maximumWidth: 200
        }
     }
  }
}