import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: infoPage
    property int procent: 0
    property string type: "infoPage"

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
            iconSource: "toolbar-back"
            onClicked: pageStack.pop()
            flat: false
        }
        ButtonRow {
            anchors.right: parent.right
            anchors.rightMargin: 2
            checkedButton: tab1content
            TabButton { tab: tab1content; text: qsTr("About ...") }
            TabButton { tab: tab2content; text: qsTr("Help") }
        }
    }
}
