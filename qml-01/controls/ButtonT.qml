import QtQuick 2.7

Rectangle {
    id: button
    width: label.width + 42 * dp > theme.Button.minWidth ? label.width + 42 * dp : theme.Button.minWidth
    height: label.height * 1.2 + 24 * dp
    color: "#C8C8C8"
    clip: true

    property alias text: label.text

    signal clicked

    Timer {
        id: timer
        interval: 250
        onTriggered: button.clicked()
    }

    SpreadEffect {
        id: spread
        anchors.fill: parent
    }

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: theme.Button.fontSize * sp
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: timer.start()
        onPressed: spread.start(mouseX, button.height / 2)
        onReleased: spread.finish()
        onCanceled: spread.finish()
    }
}