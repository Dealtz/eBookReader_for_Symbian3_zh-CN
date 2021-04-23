import QtQuick 1.1
import com.nokia.symbian 1.1

ListItem {
    property string savedText: ""
    subItemIndicator: false
    onFocusChanged: if(focus) text1.focus = true;
    Row{
        id: rowRow
        spacing: 5
        anchors.fill: parent


        TextField {
            id: text1
            anchors.verticalCenter: parent.verticalCenter
            text: name
            clip: true
            platformRightMargin: platformStyle.paddingMedium * 2
            inputMethodHints: Qt.ImhNoPredictiveText;
            width: rowRow.width - rowRow.spacing - switchComponent.width
            onTextChanged:{
                copyBookmarkModel.setProperty(index, "名称", text)
            }
        }
        Switch {
            id: switchComponent
            checked: true
            onClicked: {
                text1.enabled = !text1.enabled;
                if(text1.enabled) {
                    text1.text = savedText;
                    text1.parent.focus = true;
                    text1.placeholderText = "";
                } else {
                    savedText = text1.text;
                    text1.text = "";
                    text1.placeholderText = qsTr("删除书签");
                }
                copyBookmarkModel.setProperty(index, "删除", !text1.enabled);
                text1.forceActiveFocus();
            }
            anchors { verticalCenter: parent.verticalCenter; }
        }
    }
}
