import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0


ApplicationWindow {
    id: mainwindow
    flags: Qt.FramelessWindowHint |
       Qt.WindowMinimizeButtonHint |
       Qt.Window
    visible: true
    width: 1200
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
     width: 200; height: 200

    ListModel {
        id: fruitModel
        property string language: "en"
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
    }

    Component {
        id: fruitDelegate
        Row {
                id: fruit
                Text { text: " Fruit: " + name; color: fruit.ListView.view.fruit_color }
                Text { text: " Cost: $" + cost }
                Text { text: " Language: " + fruit.ListView.view.model.language }
        }
    }

    ListView {
        property color fruit_color: "green"
        model: fruitModel
        delegate: fruitDelegate
        anchors.fill: parent
    }
  }
            

}
