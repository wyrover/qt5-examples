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


    Rectangle
    {
        id: run
        width: 100; height: 50
        Text {
            text: qsTr("运行")
            anchors.centerIn: parent
            font.pixelSize: 32
        }
        anchors.centerIn: parent
        state: "stopState"
        states: [
            State{
                name: "runState"
                PropertyChanges{
                    target: run; color:"lightgray"
                }
                PropertyChanges{
                    target: mouseArea1; enabled: false;
                }
            },
            State{
                name: "stopState"
                PropertyChanges{
                    target: run; color: "lightblue"
                }
                PropertyChanges{
                    target: mouseArea1; enabled: true;
                }
            }
        ]
        MouseArea
        {
            id: mouseArea1
            anchors.fill: parent
            onClicked: {
                if(run.state == "runState")
                    {
                        run.state = "stopState"
                        stop.state = "stopState"
                    }
                else
                    {
                        run.state = "runState"
                        stop.state = "runState"
                    }
            }
        }
    }
 
    Rectangle
    {
        id: stop
        width: 100; height: 50
        Text
        {
            anchors.centerIn: parent
            text: qsTr("暂停")
            font.pixelSize: 32
        }
        anchors.top: run.bottom
        anchors.left: run.left
        anchors.topMargin: 10
        state: "stopState"
        states: [
            State{
                name: "runState"
                PropertyChanges{
                    target: stop; color:"lightblue"
                }
                PropertyChanges{
                    target: mouseArea2; enabled: true;
                }
            },
            State{
                name: "stopState"
                PropertyChanges{
                    target: stop; color: "lightgray"
                }
                PropertyChanges{
                    target: mouseArea2; enabled: false;
                }
            }
        ]
        MouseArea
        {
            id: mouseArea2
            anchors.fill: parent
            onClicked: {
                if(stop.state == "runState")
                {stop.state = "stopState"
                 run.state = "stopState"}
                else
                {stop.state = "runState"
                 run.state = "runState"}
            }
        }
    }
            

}
