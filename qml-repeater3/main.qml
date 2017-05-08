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


    Column {
    spacing: 2
    Repeater {
        model: ListModel {
            ListElement { name: "Mercury"; surfaceColor: "gray" }
            ListElement { name: "Venus"; surfaceColor: "yellow" }
            ListElement { name: "Earth"; surfaceColor: "blue" }
            ListElement { name: "Mars"; surfaceColor: "orange" }
            ListElement { name: "Jupiter"; surfaceColor: "orange" }
            ListElement { name: "Saturn"; surfaceColor: "yellow" }
            ListElement { name: "Uranus"; surfaceColor: "lightBlue" }
            ListElement { name: "Neptune"; surfaceColor: "lightBlue" }
        }
 
        Rectangle {
            width: 500
            height: 50
            radius: 3
            color: "lightBlue"
            Text {
                anchors.centerIn: parent
                text: name
            }
 
            Rectangle {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 2
 
                width: 16
                height: 16
                radius: 8
                border.color: "black"
                border.width: 1
 
                color: surfaceColor
            }
        }
    }
}
            

}
