import QtQuick 1.1
import com.nokia.symbian 1.1
import Qt.labs.components 1.1
import "options.js" as MyOptions

Page {
    id: optionsPage

    property string type: "optionsPage"
    property string op_fontFamily : optionsObj.fontFamily
    property int op_fontSize : optionsObj.fontSize
    property string op_codec : optionsObj.codec
    property string op_booksPath : optionsObj.booksPath

    property string op_fontColor1 : optionsObj.fontColor1
    property string op_backgroundColor1 : optionsObj.backgroundColor1
    property string op_fontColor2 : optionsObj.fontColor2
    property string op_backgroundColor2 : optionsObj.backgroundColor2
    property int op_textAlign : optionsObj.textAlign
    property int op_brightness1 : optionsObj.brightness1
    property int op_brightness2 : optionsObj.brightness2
    property bool op_textBold : optionsObj.textBold
    property bool op_useEpubCssDefault : optionsObj.useEpubCssDefault
    property bool op_showFB2NotesInPopUpMode : optionsObj.showFB2NotesInPopUpMode
    property string op_currentLanguage : optionsObj.currentLanguage
    property bool op_delSourceFile : optionsObj.delSourceFile
    property bool op_checkZipFiles : optionsObj.checkZipFiles

    function saveOptions()
    {
        optionsObj.fontFamily = op_fontFamily;
        optionsObj.fontSize = op_fontSize;
        optionsObj.codec = op_codec;
        optionsObj.fontColor1 = op_fontColor1;
        optionsObj.backgroundColor1 = op_backgroundColor1;
        optionsObj.fontColor2 = op_fontColor2;
        optionsObj.backgroundColor2 = op_backgroundColor2;
        optionsObj.textAlign = op_textAlign;
        optionsObj.brightness1 = op_brightness1;
        optionsObj.brightness2 = op_brightness2;
        optionsObj.textBold = op_textBold;
        optionsObj.useEpubCssDefault = op_useEpubCssDefault;
        optionsObj.showFB2NotesInPopUpMode = op_showFB2NotesInPopUpMode;
        optionsObj.currentLanguage = op_currentLanguage;
        optionsObj.delSourceFile = op_delSourceFile;
        optionsObj.checkZipFiles = op_checkZipFiles;
        optionsObj.write();
        contentPage.updateSettings();
        pageStack.pop();
    }

    function itemClicked(t)
    {
        switch (t)
        {
        case 1: return pageStack.push(selFontPage)
        case 2: return pageStack.push(selFontSizePage)
//        case 3: return pageStack.push(selCodecPage)
        case 4:
            selColorsPage._type = 1;
            selColorsPage.fontColor = op_fontColor1;
            selColorsPage.backgroundColor = op_backgroundColor1;
//            selColorsPage.brightness2 = op_brightness1;
//            selColorsPage.brightness = op_brightness1;
            selColorsPage.setBrightness(op_brightness1)
            pageStack.push(selColorsPage);
            return;
        case 5:            
            selColorsPage._type = 2;
            selColorsPage.fontColor = op_fontColor2;
            selColorsPage.backgroundColor = op_backgroundColor2;
//            selColorsPage.brightness2 = op_brightness2;
//            selColorsPage.brightness = op_brightness2;
            selColorsPage.setBrightness(op_brightness2);
            pageStack.push(selColorsPage);
            return;
        case 6:
            selectionDialog.open();
            return;
        case 8:
            selMoreProperties.op_useEpubCssDefault = op_useEpubCssDefault;
            selMoreProperties.op_showFB2NotesInPopUpMode = op_showFB2NotesInPopUpMode;
            selMoreProperties.op_lang = op_currentLanguage;
            selMoreProperties.op_delSourceFile = op_delSourceFile;
            selMoreProperties.op_checkZipFiles = op_checkZipFiles;
            return pageStack.push(selMoreProperties);
        default:
            optionsObj.selectBooksPath();
        }
    }

    function colorsSelectedOk()
    {
        switch(selColorsPage._type){
        case 1:op_fontColor1 = selColorsPage.fontColor;
            op_backgroundColor1 = selColorsPage.backgroundColor;
            op_brightness1 = selColorsPage.brightness;
            break;
        case 2:op_fontColor2 = selColorsPage.fontColor;
            op_backgroundColor2 = selColorsPage.backgroundColor;
            op_brightness2 = selColorsPage.brightness;
            break;
        }
    }

    function morePropertiesOk()
    {
        op_useEpubCssDefault = selMoreProperties.op_useEpubCssDefault;
        op_showFB2NotesInPopUpMode = selMoreProperties.op_showFB2NotesInPopUpMode;
        op_currentLanguage =selMoreProperties.op_lang;
        op_delSourceFile = selMoreProperties.op_delSourceFile;
        op_checkZipFiles = selMoreProperties.op_checkZipFiles;
    }

    function fontFamilySelected(n)
    {
        op_fontFamily = n;
    }

    function codecSelected(n)
    {
        op_codec = n;
    }

    function fontSizeSelected(n)
    {
        op_fontSize = n;
    }

    SelFontFamily{
        id: selFontPage
        parent: pageStack
    }
    SelFontSize{
        id: selFontSizePage
        parent: pageStack
    }
//    SelCodec{
//        id: selCodecPage
//        parent: pageStack
//    }
    SelColors{
        id: selColorsPage
        parent: pageStack
    }
    SelColor{
        id: selColorPage
        parent: pageStack
    }
    MoreProperties{
        id: selMoreProperties
        parent: pageStack
    }

    Component.onCompleted: {
        selColorsPage.clickedOk.connect(colorsSelectedOk);
        selFontPage.selected.connect(fontFamilySelected);
//        selCodecPage.selected.connect(codecSelected);
        selFontSizePage.selected.connect(fontSizeSelected);
        selMoreProperties.clickedOk.connect(morePropertiesOk);
    }

    ListModel
    {
        id: listModel
        ListElement{
            _typ: 1
        }
        ListElement{
            _typ: 2
        }
        ListElement{
            _typ: 4
        }
        ListElement{
            _typ: 5
        }
        ListElement{
            _typ: 6
        }
        ListElement{
            _typ: 7
        }
        ListElement{
            _typ: 8
        }
    }

    Component{
        id: listDelegate
        ListItem{//1 - Font Family
            id: item1
            mode: "normal"
            subItemIndicator: true
            onClicked: itemClicked(_typ)
            height: _typ === 2 ? implicitHeight + fontstyle.implicitHeight : undefined
            Rectangle {
                id: famlyRect
                visible: _typ === 1
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("字体列表")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: famlyRect.width
                        height: 25
                        color: "#221d1d"
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: optionsPage.op_fontFamily
                            color:platformStyle.colorNormalMid
                        }
                    }
                }
            }
            Rectangle {
                id: fontSizeRect
                visible: _typ === 2
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("字体大小")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: fontSizeRect.width
                        height: 25
                        color: "#221d1d"
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: optionsPage.op_fontSize
                            color:platformStyle.colorNormalMid
                        }
                    }
                    CheckBox{
                        id: fontstyle
                        text: qsTr("使用粗体风格")
                        anchors.topMargin: platformStyle.paddingMedium
                        checked: op_textBold
                        onClicked: {op_textBold = !op_textBold;}
                    }
                }
            }
            Rectangle {
                id: darkColorsRect
                visible: _typ === 4
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("夜晚模式")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: darkColorsRect.width
                        height: 25
                        color: Qt.lighter(optionsPage.op_backgroundColor1, optionsPage.op_brightness1 / 100)
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: qsTr("示例文本")
                            color: Qt.lighter(optionsPage.op_fontColor1, optionsPage.op_brightness1 / 100)
                        }
                    }
                }
            }
            Rectangle {
                id: daylightColorsRect
                visible: _typ === 5
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("白天模式")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: daylightColorsRect.width
                        height: 25
                        color: Qt.lighter(optionsPage.op_backgroundColor2, optionsPage.op_brightness2 / 100)
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: qsTr("示例文本")
                            color: Qt.lighter(optionsPage.op_fontColor2, optionsPage.op_brightness2 / 100)
                        }
                    }
                }
            }
            Rectangle {
                id: textAlignRect
                visible: _typ === 6
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("文本对齐")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: textAlignRect.width
                        height: 25
                        color: "#221d1d"
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: {
                                switch(op_textAlign){
                                case 1: return qsTr("整齐");
                                case 2: return qsTr("右对齐");
                                default: return qsTr("左对齐")
                                }
                            }
                            color: platformStyle.colorNormalMid
                        }
                    }
                }
            }
            Rectangle {
                id: dirRect
                visible: _typ === 7
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("导入图书目录")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: dirRect.width
                        height: 25
                        color: "#221d1d"
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: optionsPage.op_booksPath
                            color:platformStyle.colorNormalMid
                        }
                    }
                }
            }
            ListItemText {
                mode: "normal"
                role: "Title"
                visible: _typ === 8
                text: qsTr("更多选项")
                anchors.fill: parent.paddingItem
            }
        }
    }

    SelectionDialog {
        id: selectionDialog
        titleText: qsTr("文本对齐")
        model: textAlignmentModel
        selectedIndex: op_textAlign
        onSelectedIndexChanged: op_textAlign = selectionDialog.selectedIndex
    }

    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        delegate: listDelegate
        model: listModel
        focus: true
    }
    ScrollDecorator {
        flickableItem: listView
    }

    tools:
        ToolBarLayout {
        backButton: true
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: pageStack.pop();
            flat: false
        }
        ToolButton {
            iconSource: "qrc:/img/tb_ok"
            onClicked: saveOptions();
            flat: false
        }
    }
    onStatusChanged: {
        if(status === PageStatus.Active){
            listView.focus = true;
            window.state = "";
            statusBarText.text = qsTr("设置");
        }
    }
    onFocusChanged: {
        if(focus) listView.focus = true;
    }
}
