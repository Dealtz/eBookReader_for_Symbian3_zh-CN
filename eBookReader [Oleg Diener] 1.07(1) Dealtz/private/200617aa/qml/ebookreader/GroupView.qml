import QtQuick 1.1
import com.nokia.symbian 1.1
import MyLibrary 1.0

Page {
    id: groupViewPage

    property string type: "groupViewPage"
    property bool useGrid: false
    signal cancelGrouping
    signal indexSelected(int n)
    function cancel()
    {
        cancelGrouping();
        pageStack.pop();
    }
    function gotoIndex(n)
    {
        indexSelected(n);
        pageStack.pop();
    }

    GroupViewModel {
        id: groupModel
    }

    Loader{
        id: listView
        source: useGrid?"GroupGridView.qml":"GroupListView.qml"
        anchors.fill: parent
    }

    Component{
        id: groupDelegate

        ListItem{
            height: listView.cellHeight
            width: listView.cellWidth
            ListItemText{
//                height: parent.height - 10
//                width: parent.width - 10
                anchors.left: useGrid?undefined:parent.paddingItem.left
                anchors.horizontalCenter: useGrid?parent.horizontalCenter:undefined
                anchors.verticalCenter:  parent.verticalCenter
                role: "Title"
                text: sectionName
            }
            onClicked: gotoIndex(bookIndex);
        }
    }    

    tools:
        ToolBarLayout {
        backButton: true
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: pageStack.pop();
            //flat: false
        }
        Button {
            text: "取消分组"
            anchors.right: parent.right
            anchors.rightMargin: 2
            onClicked: cancel();
        }
    }
    onStatusChanged: {
        if(status === PageStatus.Active){
            listView.focus = true;
            window.state = "";
            statusBarText.text = "分组浏览";
        }
    }
    onFocusChanged: {
        if(focus) listView.focus = true;
    }
    Component.onCompleted: groupModel.load();
}
