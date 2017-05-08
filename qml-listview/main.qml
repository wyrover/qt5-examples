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

    ListModel {
      id: nameModel
      ListElement { name: "Alice" }
      ListElement { name: "Bob" }
      ListElement { name: "Jane" }
      ListElement { name: "Harry" }
      ListElement { name: "Wendy" }
    }

    Component {
      id: nameDelegate
      Text {
          text: name;
          font.pixelSize: 24
      }
    }

    ListView {
        anchors.fill: parent
        clip: true
        model: nameModel
        delegate: nameDelegate
        header: bannercomponent
        footer: Rectangle {
            width: parent.width; height: 30;
            gradient: clubcolors
        }
//        highlight: Rectangle {
//            width: parent.width
//            color: "lightgray"
//        }
    }

    Component {     //instantiated when header is processed
        id: bannercomponent
        Rectangle {
            id: banner
            width: parent.width; height: 50
            gradient: clubcolors
            border {color: "#9EDDF2"; width: 2}
            Text {
                anchors.centerIn: parent
                text: "Club Members"
                font.pixelSize: 32
            }
        }
    }
    Gradient {
        id: clubcolors
        GradientStop { position: 0.0; color: "#8EE2FE"}
        GradientStop { position: 0.66; color: "#7ED2EE"}
    }
            

}
