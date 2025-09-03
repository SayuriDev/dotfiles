import QtQuick 
import Quickshell
import QtQuick.Layouts

import "../."

Rectangle {
    width: clockText.paintedWidth + 15
    height: 32
    color: mouseArea.containsMouse ? Style.overlay : Style.surface 

    // border.width: 
    radius: 8
    MouseArea {
           id: mouseArea
           anchors.fill: parent
           hoverEnabled: true
           onClicked: console.log("TODO:")
           implicitWidth: 10
       }
    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh:mm")
        font.pixelSize: 19
        font.family: Style.fontFamily

        font.bold: true
        anchors.centerIn: parent
        color: active ? Style.textPrimary : Style.textSecondary
     }

     SystemClock {
        id: clock
     }

}