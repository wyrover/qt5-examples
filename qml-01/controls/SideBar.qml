import QtQuick 2.7

Rectangle {
    id: tagView

    anchors.top: mainView.top
    anchors.bottom: mainView.bottom
    anchors.left: mainView.left

    width: 200
    color: "black"
    border.width: 1
    border.color: "white"

    ListView {
        id: availableTagsView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: scrollbar.left
        anchors.left: parent.left
        anchors.margins: 5
        
    }
    
}