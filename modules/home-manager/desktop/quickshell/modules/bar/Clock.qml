import QtQuick 
import Quickshell
import QtQuick.Layouts
Rectangle {
   property var style
    width: clockText.paintedWidth + 15
    height: 32
    color: mouseArea.containsMouse ? style.overlay : style.surface  /// tu dziala

    // border.width: 
    radius: 8
    MouseArea {
           id: mouseArea
           anchors.fill: parent
           hoverEnabled: true
           onClicked: console.log(style.textPrimary)
           implicitWidth: 10
       }
    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh:mm")
        font.pixelSize: 19
        font.family: style.fontFamily

        font.bold: true
        anchors.centerIn: parent
        color: style.error
     }

     SystemClock {
        id: clock
     }

}