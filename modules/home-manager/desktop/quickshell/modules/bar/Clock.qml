import QtQuick 

Rectangle {
    width: clockText.paintedWidth + 20
    height: clockText.paintedHeight + 20

    // color: modelData.active ? "#4CAF50" : "#222"
    // border.color: modelData.active ? "#A5D6A7" : "#444"
    // border.width: 2
    // radius: 8

    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh \nmm")
        font.pixelSize: 19
        anchors.centerIn: parent
     }
}