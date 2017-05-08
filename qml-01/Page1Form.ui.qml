import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "qml"
import "controls"

Item {
    id: item1
    property alias textField1: textField1
    property alias button1: button1

    RowLayout {
        transformOrigin: Item.Center
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {
            id: textField1
            placeholderText: qsTr("Text Field")
        }

        Button {
            id: button1
            text: qsTr("点击测试")
        }

        Label {
            id: label
            text: qsTr("测试中文")
        }

        Button {
            id: button
            text: "A Special Button"
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: button.down ? "#d6d6d6" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 1
                radius: 4
            }
        }

        ImageButton {
            id: imageButton
            width: 57
            height: 49
            icon: "qt.png"
        }
    }

    Rectangle {
        x: 71
        y: 104
        width: 169
        height: 64
        color: "green"
        border.color: "red"
        border.width: 2
        radius: 12
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "red"
            }
            GradientStop {
                position: 0.50
                color: "green"
            }
            GradientStop {
                position: 1.0
                color: "blue"
            }
        }
    }

    Rectangle {
        x: 24
        y: 208
        width: 477
        height: 205
        color: "green"
        Text {
            id: normal
            width: 150
            height: 100
            wrapMode: Text.WordWrap
            font.bold: true
            font.pixelSize: 24
            font.underline: true
            text: "Hello Blue <font color=\"red\">Text</font>"
            anchors.centerIn: parent
        }
        Text {
            id: outline
            anchors.left: normal.left
            anchors.top: normal.bottom
            anchors.topMargin: 4
            font.pixelSize: 24
            text: "A Test Tool!"
            style: Text.Outline
            styleColor: "red"
        }
    }

    Ad {
        id: ad
        x: 277
        y: 117
        width: 259
        height: 51
        icon: "qt.png"

        ButtonTT {
            id: buttonTT
            x: 80
            y: -12
            width: 97
            height: 38
        }
    }

    BottomBar {
        id: bottomBar
        x: 0
        y: 515
    }

    TopBar {
        id: topBar
        x: 0
        y: 439
    }
}
