import QtQuick 1.1
import com.nokia.symbian 1.1

CommonDialog {
    id: root
    property int selectedIndex: -1
    signal gotoChapter( int selIdx )

    titleText: qsTr("Index page")
    buttons: []
    privateCloseIcon: true
    height: parent.height
    content: Item {
        id: clipItem
        anchors.fill: parent
        ListView {
            id: listView
            clip: true
            focus: true
            anchors.fill: parent
            delegate: ListItem {
                subItemIndicator: true
                onClicked: {
                    root.selectedIndex = index
                    root.accept()
                }
                ListItemText {
                    id:id1
                    anchors.verticalCenter: parent.paddingItem.verticalCenter
                    role: "SubTitle"
                    text: "  " + title
                    clip: true
                    width: parent.paddingItem.width
                    color: if(isCurrentChapter){
                               platformInverted ? platformStyle.colorNormalLinkInverted
                                                       : platformStyle.colorNormalLink
                           } else {
                               platformInverted ? platformStyle.colorNormalMidInverted
                                                : platformStyle.colorNormalMid
                           }
                }
            }
            model: indexPageModel
        }
        ScrollDecorator {
            flickableItem: listView
        }
    }
    onAccepted: { gotoChapter(selectedIndex) }
    onStatusChanged: {
        if (status == DialogStatus.Open) {
            listView.focus = true
        }
    }
}
