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
      id:closeBtn
      height:25
      width:25
      anchors.right: parent.right
      anchors.rightMargin:5
      anchors.top: parent.top
      anchors.topMargin:5
      color:"#aaff0000"
      Text {
        text:"x"
        anchors.centerIn: parent
      }
      MouseArea{
        anchors.fill: parent
        onClicked:
        {
          //Qt.quit()无法关闭窗口
          mainwindow.close()
        }
      }
    }
    

    SwipeView {
        id: swipeView
        anchors.fill: parent
        anchors.topMargin: 40
        currentIndex: tabBar.currentIndex


        Page1 {
        }

        Page2 {            
        }

        Page3 {
        }

        Page4 {
        }

        Page5 {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
        TabButton {
            text: qsTr("Third")
        }

        TabButton {
            text: qsTr("Page4")
        }

        TabButton {
            text: qsTr("Page5")
        }
    }
}
