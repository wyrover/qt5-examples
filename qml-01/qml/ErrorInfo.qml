import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.width * 0.08
    y: -height
    color: "#77ff4c4c"

    property bool animEnabled: false

    Behavior on y { enabled: animEnabled; NumberAnimation {} }

    function show(text)
    {
        animEnabled = true
        t.text = text
        y = 0
        hideTimer.start()
    }

    function hide()
    {
        y = -height
    }

    Timer {
        id: hideTimer
        interval: 3000
        onTriggered: hide()
    }

    TodoText {
        id: t
        anchors { fill: parent; margins: parent.width * 0.02 }
        wrapMode: Text.WordWrap
    }

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 1
        color: "#995555"
    }
}