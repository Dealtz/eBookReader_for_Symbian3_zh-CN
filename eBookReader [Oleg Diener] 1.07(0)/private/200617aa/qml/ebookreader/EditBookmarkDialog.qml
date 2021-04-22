import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: root

    property string type: "editBookmarkPage"
    property int selectedIndex: -1
    property bool completed: false


    height: parent.height

    Label{
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        visible: bookmarkModel.isEmpty
        text: "无书签"
    }

    CopyBookmarkModel{
        id: copyBookmarkModel
    }

    ListView {
        id: listView
        clip: true
        visible: !bookmarkModel.isEmpty
        anchors.fill: parent
        delegate: BookmarkEditItem{onClicked: completed = true;}
        model: copyBookmarkModel
    }
    ScrollDecorator {
        flickableItem: listView
    }


    onStatusChanged: {
        if(status === PageStatus.Active){
            statusBarText.text = "书签";
            listView.focus = true;
        }
    }
    onFocusChanged: {
        if(focus) listView.focus = true;
    }
    tools:
        ToolBarLayout {
        backButton: true
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: pageStack.pop();
        }
        ToolButton {
            iconSource: "qrc:/img/tb_ok"
            onClicked: {
                copyBookmarkModel.save();
                pageStack.pop();
            }
        }
    }
    Component.onCompleted: copyBookmarkModel.load();
}
