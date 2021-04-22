import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    signal selected(string n)
    function itemClicked(n)
    {
        selected(n);
        pageStack.pop();
    }
    ListModel{
        id: fontSizeList
        ListElement{
            size: 6
        }
        ListElement{
            size: 8
        }
        ListElement{
            size: 10
        }
        ListElement{
            size: 12
        }
        ListElement{
            size: 14
        }
        ListElement{
            size: 16
        }
        ListElement{
            size: 18
        }
        ListElement{
            size: 20
        }
        ListElement{
            size: 22
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        model: fontSizeList
        delegate: listDelegate
     }
    ScrollDecorator {
        flickableItem: listView
    }
    Component {
        id: listDelegate        
        ListItem {
            id: listItem
            onClicked: itemClicked(modelData)
            Text {
                anchors.centerIn: listItem.paddingItem
                text: size
                font.pointSize: size
                color: "White"
                clip: true
            }
        }
    }
    onStatusChanged: {
        if (status === PageStatus.Active) {
            listView.focus = true
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
            onClicked: pageStack.pop()
        }
    }
}
