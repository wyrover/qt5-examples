import QtQuick 2.0

Rectangle {
    id: btn
    color: buttonEnabled ? buttonColor : "#cccccc"
    border.color: buttonEnabled ? Qt.darker(buttonColor) : "#999999"
    radius: width * 0.01

    signal clicked()
    property alias text: t.text
    property color buttonColor: "#428bca"
    property bool buttonEnabled: true
    property int fontSize: Math.min(width * 0.09, height*0.3)

    Text {
        id: t
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: fontSize
    }

    MouseArea {
        anchors.fill: parent
        enabled: buttonEnabled
        onPressed: colorAnimation.restart()
        onClicked: btn.clicked()
    }

    ColorAnimation { id: colorAnimation; target: btn; property: "color"; from: Qt.lighter(buttonColor); to: buttonColor; duration: 200 }
}