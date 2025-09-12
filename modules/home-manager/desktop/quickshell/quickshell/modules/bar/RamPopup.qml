import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import Quickshell.Widgets
import qs.modules.common
import qs.modules.popup.hardwareUsage

PanelWindow {
    id: root

    property bool showCpu: false
    property bool showRam: false
    property bool showDisk: false

    anchors.top: parent.top
    margins.top: parent.height
    implicitWidth: 800
    implicitHeight: 400
    visible: false
    exclusionMode: ExclusionMode.Ignore

    ColumnLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.fill: parent
        anchors.margins: 10

        Button {
            text: "cpu"
            onClicked: showCpu = !showCpu
        }

        Button {
            text: "ram"
        }

        Button {
            text: "disk"
        }

    }

    ColumnLayout {
        visible: showCpu
        // anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 50

        CpuUsage {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredHeight: 160
            Layout.preferredWidth: 160
        }
        // anchors.centerIn: parent

    }

}
