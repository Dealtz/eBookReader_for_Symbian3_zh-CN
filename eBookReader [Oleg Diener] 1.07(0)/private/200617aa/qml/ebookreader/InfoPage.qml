import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: infoPage
    property int procent: 0
    property string type: "infoPage"
    property bool isHelpViewed: false

    function getLangPath()
    {
        if(optionsObj.langSpecificPath === "../en/") {
            return "../ebookreader/";
        }
        return optionsObj.langSpecificPath;
    }


    // define a blank tab group so we can add the pages of content later
    TabGroup {
        id: tabGroup
        anchors { left: parent.left; right: parent.right; top: parent.top; bottom: parent.bottom }

        // define the content for tab 1
        Page {
            id: tab1content
            Flickable {
                id: flickable1
                flickableDirection: Flickable.VerticalFlick
//                anchors.top: parent.top
//                anchors.bottom: buyBtn.top
//                width: parent.width
                anchors.fill: parent
                clip: true
                contentHeight: aboutColumn.height
                boundsBehavior: Flickable.StopAtBounds

                Loader {
                    id: aboutColumn
                    source: getLangPath() + "AboutColumn.qml"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
            }
            ScrollDecorator {
                flickableItem: flickable1
            }
//            Button{
//                id: buyBtn
//                anchors.bottom: tab1content.bottom
//                anchors.margins: 5
//                anchors.horizontalCenter: parent.horizontalCenter
//                text: qsTr("Buy full version")
//                onClicked: optionsObj.buy()
//            }
        }

        // define the content for tab 2
        Page {
            id: tab2content
            Flickable {
                id: flickable2
                flickableDirection: Flickable.VerticalFlick
                anchors.fill: parent
                clip: true
                contentHeight: helpColumn.height
                boundsBehavior: Flickable.StopAtBounds
                Loader {
                    id: helpColumn
                    source: getLangPath() + "HelpColumn.qml"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
            }
            ScrollDecorator {
                flickableItem: flickable2
            }
        }
    }

    tools: ToolBarLayout {
        ToolButton {
            id: backBtn
            iconSource: "toolbar-back"
            onClicked: pageStack.pop()
        }
        ToolButton {
            id: shareBtn
            iconSource: "toolbar-share"
            onClicked: optionsObj.shareIt();
            anchors.left: backBtn.right
            anchors.leftMargin: 2
        }
        Button {
            id: helpBtn
            onClicked: {
                if (isHelpViewed) {
                    tabGroup.currentTab = tab1content;
                    text = "帮助";
                    isHelpViewed = false;
                }else{
                    tabGroup.currentTab = tab2content;
                    text = "关于";
                    isHelpViewed = true;
                }
            }
            text: "帮助"
            anchors.right: parent.right
            anchors.rightMargin: 2
        }
    }
}
