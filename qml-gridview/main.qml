import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0


ApplicationWindow {
    id: mainwindow
    flags: Qt.FramelessWindowHint |
       Qt.WindowMinimizeButtonHint |
       Qt.Window
    visible: true
    width: 500
    height: 800
    title: qsTr("QML 窗体测试")
    color:Qt.rgba(0.5,0.5,0.5,0.9)

    MouseArea{
      id: dragRegion
      anchors.fill: parent
      property point clickPos:"0,0"
      onPressed:{
        clickPos =Qt.point(mouse.x,mouse.y)
      }

      onPositionChanged:{
        //鼠标偏移量
        var delta =Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        //如果mainwindow继承自QWidget,用setPos
        mainwindow.setX(mainwindow.x+delta.x)
        mainwindow.setY(mainwindow.y+delta.y)
      }
    }


    Rectangle {
    width: 500
    height: 800
 
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#dbddde" }
        GradientStop { position: 1.0; color: "#5fc9f8" }
    }
 
    ListModel {
        id: theModel
 
        ListElement { number: 0 }
        ListElement { number: 1 }
        ListElement { number: 2 }
        ListElement { number: 3 }
        ListElement { number: 4 }
        ListElement { number: 5 }
        ListElement { number: 6 }
        ListElement { number: 7 }
        ListElement { number: 8 }
        ListElement { number: 9 }
    }
 
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
 
        height: 40
 
        color: "#53d769"
        border.color: Qt.lighter(color, 1.1)
 
        Text {
            anchors.centerIn: parent
 
            text: "Add item!"
        }
 
        MouseArea {
            anchors.fill: parent
 
            onClicked: {
                theModel.append({"number": ++parent.count});
            }
        }
 
        property int count: 9
    }
 
    GridView {
        anchors.fill: parent
        anchors.margins: 20
        anchors.bottomMargin: 80
 
        clip: true
 
        model: theModel
 
        cellWidth: 45
        cellHeight: 45
 
        delegate: numberDelegate
    }
 
    Component {
        id: numberDelegate
 
        Rectangle {
            id: wrapper
 
            width: 40
            height: 40
 
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#f8306a" }
                GradientStop { position: 1.0; color: "#fb5b40" }
            }
 
            Text {
                anchors.centerIn: parent
 
                font.pixelSize: 10
 
                text: number
            }
 
            MouseArea {
                anchors.fill: parent
 
                onClicked: {
                    if (!wrapper.GridView.delayRemove)
                        theModel.remove(index);
                }
            }
 
            GridView.onRemove: SequentialAnimation {
                PropertyAction { target: wrapper; property: "GridView.delayRemove"; value: true }
                NumberAnimation { target: wrapper; property: "scale"; to: 0; duration: 250; easing.type: Easing.InOutQuad }
                PropertyAction { target: wrapper; property: "GridView.delayRemove"; value: false }
            }
 
            GridView.onAdd: SequentialAnimation {
                NumberAnimation { target: wrapper; property: "scale"; from: 0; to: 1; duration: 250; easing.type: Easing.InOutQuad }
            }
        }
    }
}
            

}
