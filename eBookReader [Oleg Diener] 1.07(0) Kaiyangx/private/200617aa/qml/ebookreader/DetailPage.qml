import QtQuick 1.1
import com.nokia.symbian 1.1
import MyLibrary 1.0
import "options.js" as OPTIONS


Page {
    id: detailPage
    property string type: "detailPage"
    property string title: ""
    property int index_: -1


    onStatusChanged: {
        if(status === PageStatus.Active)
            statusBarText.text = qsTr("详情");
    }

    function saveDetails()
    {
        detailColumn.saveDetails()
        bookEntry.submit();
    }

    tools: ToolBarLayout {
        ToolButton {
            id: backButton
            iconSource: "toolbar-back"
            onClicked: {
                bookEntry.revert();
                pageStack.pop();
            }
            flat: false
        }
        ToolButton {
            iconSource: "qrc:/img/tb_ok"
            onClicked: {
                saveDetails();
                pageStack.pop();
            }
            flat: false
        }
    }

    Rectangle {
        id: rectangle1
        color: "transparent"
        anchors.fill: parent

        Flickable {
            id: flickable1
            flickableDirection: Flickable.VerticalFlick
            anchors.fill: parent
            clip: true
            contentHeight: detailColumn.height
//            boundsBehavior: Flickable.StopAtBounds
            DetailColumn {
                id: detailColumn
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
}
