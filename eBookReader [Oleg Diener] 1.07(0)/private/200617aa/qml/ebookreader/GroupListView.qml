import QtQuick 1.1
import com.nokia.symbian 1.1
import MyLibrary 1.0

Item{
    id: root


    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        delegate: groupDelegate
        model: groupModel
        focus: true
    }

    ScrollDecorator {
        flickableItem: listView
    }
}
