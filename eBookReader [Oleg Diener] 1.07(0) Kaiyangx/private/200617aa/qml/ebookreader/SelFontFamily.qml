import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    signal selected(string n)
    function itemClicked(n)
    {
        selected(n);
        pageStack.pop();
    }
    ListView {
        id: listView
        anchors.fill: parent
        model: Qt.fontFamilies()
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
            ListItemText {
                anchors.fill: listItem.paddingItem
                mode: listItem.mode
                role: "Title"
                text: modelData
                font.family: modelData;
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
            flat: false
        }
    }
}
