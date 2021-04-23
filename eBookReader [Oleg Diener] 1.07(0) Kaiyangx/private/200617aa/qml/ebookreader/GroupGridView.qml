import QtQuick 1.1
import com.nokia.symbian 1.1
import MyLibrary 1.0

Item{
    id: root
    GridView {
        id: listView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true
        delegate: groupDelegate
        model: groupModel
        width: Math.floor(parent.width / listView.cellWidth) * cellWidth
        focus: true
    }

    ScrollDecorator {
        flickableItem: listView
    }
}
