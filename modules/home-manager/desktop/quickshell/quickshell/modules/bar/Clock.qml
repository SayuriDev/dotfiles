import QtQuick 
import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import qs.modules.common

RowLayout {
    width: clockText.paintedWidth + 15
    height: 32
    // color: mouseArea.containsMouse ? Style.overlay : Style.surface
    // radius: 8
        spacing: 22
    IconImage {
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/shared/profile.png`)
        implicitSize: 35
    }
    MouseArea {
           id: mouseArea
           anchors.fill: parent
           hoverEnabled: true
           onClicked: console.log(Style.textPrimary)
           implicitWidth: 10
    }
    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh:mm \ndd, dddd ")
        font.pixelSize: 15
        // font.family: Style.fontFamily
        anchors.centerIn: parent
        color: active ? Style.textPrimary : Style.textSecondary
        }


     SystemClock {
        id: clock
     }

}