import QtQuick 1.1
import com.nokia.symbian 1.1
import MyLibrary 1.0
import "options.js" as OPTIONS


Page {
    id: annotationPage
    property string type: "annotationPage"
    property string annotation: ""


    onStatusChanged: {
        if(status === PageStatus.Active)
            statusBarText.text = qsTr("注解");
    }

    tools: ToolBarLayout {
        ToolButton {
            id: backButton
            iconSource: "toolbar-back"
            onClicked: {
                pageStack.pop();
            }
            flat: false
        }
    }    

    Rectangle {
        id: rectangle1
        color: optionsObj.backgroundColor2
        anchors.fill: parent
        Flickable {
            id: flickable
            contentWidth: textEdit.width
            contentHeight: textEdit.height
            flickableDirection: Flickable.VerticalFlick
            anchors.fill: parent
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            TextEdit {
                id: textEdit
                width: annotationPage.width
                readOnly: true
                color: optionsObj.fontColor2
                text: annotation

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.family: optionsObj.fontFamily
                font.pointSize: optionsObj.fontSize
                onContentsSizeChanged: {
                    if ((height) > flickable.height) {
                        var yoff = (flickable.height / 2 + flickable.contentY);
                        flickable.contentY = yoff - flickable.height / 2;
                    }
                }
            }
        }
        ScrollDecorator {
            flickableItem: flickable
        }
    }
}
