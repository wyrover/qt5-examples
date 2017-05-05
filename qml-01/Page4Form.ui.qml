import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: item1
    RowLayout {
        id: rowLayout
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 69
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout
            width: 100
            height: 100
            Layout.fillWidth: false
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            transformOrigin: Item.Left

            Button {
                id: button
                text: qsTr("中文 button")
            }

            Button {
                id: button1
                text: qsTr("Button")
            }
        }

        ColumnLayout {
            id: columnLayout1
            width: 100
            height: 100
            transformOrigin: Item.Center

            Button {
                id: button2
                text: qsTr("Button")
            }
        }
    }

    RowLayout {
        id: rowLayout1
        height: 49
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: "#b42f2f"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
