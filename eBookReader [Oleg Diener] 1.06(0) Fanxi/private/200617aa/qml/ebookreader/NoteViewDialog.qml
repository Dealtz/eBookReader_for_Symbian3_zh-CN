import QtQuick 1.1
import com.nokia.symbian 1.1

CommonDialog {
    id: noteViewDialog
    property string note: ""

    function getTextAlign()
    {
        switch(optionsObj.textAlign){
        case 1: return Text.AlignJustify;
        case 2: return Text.AlignRight;
        default: return Text.AlignLeft;
        }
    }

    titleText: qsTr("Note")
    buttons: []
    privateCloseIcon: true
    height: parent.height
    content: Item {
        id: itemDialog
        anchors.fill: parent
        anchors.margins: 5
        Rectangle {
            id: rectangle1
            color: optionsObj.colorsType === 0?Qt.lighter(optionsObj.backgroundColor2,optionsObj.brightness2 / 100):Qt.lighter(optionsObj.backgroundColor1,optionsObj.brightness1 / 100)
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
                    width: rectangle1.width
                    readOnly: true
                    color: optionsObj.colorsType === 0?Qt.lighter(optionsObj.fontColor2,optionsObj.brightness2 / 100):Qt.lighter(optionsObj.fontColor1,optionsObj.brightness1 / 100)
                    text: note

                    textFormat: TextEdit.RichText
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: getTextAlign()
                    font.family: optionsObj.fontFamily                    
                    font.pointSize: optionsObj.fontSize
                    font.bold: optionsObj.textBold
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
    onRejected: {
        note = ""
    }
}
