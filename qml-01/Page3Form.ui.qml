import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        columns: 2

        Button {
            id: button
            text: qsTr("Button")
        }

        Button {
            id: button1
            text: qsTr("Button")
        }

        Button {
            id: button2
            text: qsTr("Button")
        }

        Button {
            id: button3
            text: qsTr("Button")
        }
    }
}
