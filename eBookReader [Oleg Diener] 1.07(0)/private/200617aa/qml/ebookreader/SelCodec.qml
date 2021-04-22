import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    signal selected(string n)
    function itemClicked(n)
    {
        selected(n);
        stack.pop();
    }
    ListView {
        id: codecList
        anchors.fill: parent
//        anchors.bottomMargin: bar1.height

//        model: codecModel//TODO
        delegate: listDelegate
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
            }
        }
    }
    tools:
        ToolBarLayout {
        backButton: true
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: stack.pop()
        }
    }
}
