import QtQuick 
import "../."

Rectangle {
    width: clockText.paintedWidth + 20
    height: clockText.paintedHeight + 20
    color: mouseArea.containsMouse ? Style.overlay : Style.surface 

    // border.width: 
    radius: 8
    MouseArea {
           id: mouseArea
           anchors.fill: parent
           hoverEnabled: true
           onClicked: console.log("TODO:")
       }
    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh \nmm")
        font.pixelSize: 19
        font.family: Style.fontFamily

        font.bold: true
        anchors.centerIn: parent
        color: active ? Style.textPrimary : Style.textSecondary
     }
}