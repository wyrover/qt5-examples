import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "controls"

Item {
    RowLayout {
        id: rowLayout
        anchors.fill: parent
    }

    Text {
        id: text1
        x: 39
        y: 39
        text: qsTr("test Text Control")
        font.pixelSize: 12
    }

    TextEdit {
        id: textEdit
        x: 47
        y: 72
        width: 80
        height: 20
        text: qsTr("test Text Edit control")
        font.pixelSize: 12
    }

    TextInput {
        id: textInput
        x: 39
        y: 112
        width: 80
        height: 20
        text: qsTr("Text Input")
        font.pixelSize: 12
    }

    CheckBox {
        id: checkBox
        x: 39
        y: 288
        text: qsTr("Check Box")
    }

    BusyIndicator {
        id: busyIndicator
        x: 39
        y: 158
    }

    Button {
        id: button
        x: 39
        y: 230
        text: qsTr("Button")
    }

    CheckDelegate {
        id: checkDelegate
        x: 39
        y: 342
        text: qsTr("Check Delegate")
    }

    ComboBox {
        id: comboBox
        x: 39
        y: 416
    }

    Frame {
        id: frame
        x: 293
        y: 60
        width: 200
        height: 200
    }

    GroupBox {
        id: groupBox
        x: 293
        y: 272
        width: 200
        height: 200
        title: qsTr("Group Box")
    }

    Label {
        id: label
        x: 293
        y: 13
        text: qsTr("Label")
    }

    Pane {
        id: pane
        x: 507
        y: 60
        width: 200
        height: 200

        SpinBox {
            id: spinBox
            x: 30
            y: 0
        }

        SwipeDelegate {
            id: swipeDelegate
            x: 30
            y: 46
            text: qsTr("Swipe Delegate")
        }

        Switch {
            id: switch1
            x: 33
            y: 102
            text: qsTr("Switch")
        }

        SwitchDelegate {
            id: switchDelegate
            x: 24
            y: 148
            text: qsTr("Switch Delegate")
        }
    }

    ProgressBar {
        id: progressBar
        x: 412
        y: 19
        value: 0.5
    }

    RadioButton {
        id: radioButton
        x: 510
        y: 288
        text: qsTr("Radio Button")
    }

    RadioDelegate {
        id: radioDelegate
        x: 523
        y: 342
        text: qsTr("Radio Delegate")
    }

    RangeSlider {
        id: rangeSlider
        x: 523
        y: 400
        first.value: 0.25
        second.value: 0.75
    }

    Slider {
        id: slider
        x: 536
        y: 446
        value: 0.5
    }

    TabBar {
        id: tabBar
        x: 762
        y: 92
        width: 240

        TabButton {
            id: tabButton
            x: 0
            y: 0
            text: qsTr("Tab Button")
        }

        TabButton {
            id: tabButton1
            x: 91
            y: 0
            text: qsTr("Tab Button")
        }

        TabButton {
            id: tabButton2
            text: qsTr("Tab Button")
        }
    }

    TextArea {
        id: textArea
        x: 779
        y: 158
        width: 134
        height: 156
        text: qsTr("Text Area")
    }

    ToolBar {
        id: toolBar
        x: 119
        y: 509
        width: 360

        ToolButton {
            id: toolButton
            x: 0
            y: 0
            text: qsTr("Tool Button")
        }

        ToolButton {
            id: toolButton1
            x: 107
            y: 0
            text: qsTr("Tool Button")
        }

        Tumbler {
            id: tumbler
            x: 689
            y: -276
        }
    }
}
