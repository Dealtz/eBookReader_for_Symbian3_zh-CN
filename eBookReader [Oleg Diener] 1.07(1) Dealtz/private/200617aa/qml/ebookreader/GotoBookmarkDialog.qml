import QtQuick 1.1
import com.nokia.symbian 1.1

CommonDialog {
    id: root
    property int selectedIndex: -1
    titleText: "书签"
    buttons: []
    privateCloseIcon: true
    height: parent.height
    signal gotoBookmark( int selIdx )
    content: Item {
        id: clipItem
        anchors.fill: parent

            Label{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                visible: bookmarkModel.isEmpty
                text: "没有书签"
            }

        ListView {
            id: listView
            clip: true
            visible: !bookmarkModel.isEmpty
            anchors.fill: parent
            delegate: ListItem {
                subItemIndicator: true
                onClicked: {
                    root.selectedIndex = index
                    root.accept()
                }                
                ListItemText {
                    anchors.verticalCenter: parent.paddingItem.verticalCenter
                    role: "SubTitle"
                    text: "  " + bookmarkId + ". " + name
                    clip: true
                    width: parent.paddingItem.width
                }
            }
            model: bookmarkModel
        }
        ScrollDecorator {
            flickableItem: listView
        }
    }
    onAccepted: { gotoBookmark(selectedIndex) }
    onStatusChanged: {
        if (status == DialogStatus.Open) {
            listView.focus = true
        }
    }
}
