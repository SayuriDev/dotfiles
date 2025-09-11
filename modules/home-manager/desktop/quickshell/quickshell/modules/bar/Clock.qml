import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.modules.common

RowLayout {
    spacing: 5

    IconImage {
        Layout.leftMargin: 5
        source: Qt.resolvedUrl(`${Dirs.assetsPath}/shared/profile.png`)
        implicitSize: 45

        Rectangle {
            anchors.centerIn: parent
            width: 65
            height: 65
            radius: width / 2
            color: "transparent"
            border.color: Style.background
            border.width: 11 // 12 for full rounded
        }

    }

    Text {
        id: clockText

        text: Qt.formatDateTime(clock.date, "hh:mm \ndd, dddd ")
        font.pixelSize: 15
        font.family: Style.fontFamily
        color: active ? Style.textPrimary : Style.textSecondary
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        onClicked: console.log(Style.textPrimary)
        implicitWidth: 10
    }

    SystemClock {
        id: clock
    }

}
