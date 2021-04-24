import QtQuick 1.1
import com.nokia.symbian 1.1
import "options.js" as OPTIONS

Page {
    property bool op_useEpubCssDefault : false
    property bool op_showFB2NotesInPopUpMode : false
    property bool op_delSourceFile : false
    property bool op_checkZipFiles : true
    property string op_lang: ""

    signal clickedOk
    function doOk()
    {
        op_lang = selectionDialog.model.get(selectionDialog.selectedIndex).type;
        clickedOk();
        pageStack.pop();
    }

    function getPaddingHeight()
    {
        return platformStyle.graphicSizeLarge - 2*platformStyle.paddingLarge;
    }    

    function getLangID()
    {
        if (op_lang === "ru") return 1;
        return 0;
    }

    onStatusChanged: {
        if(status === PageStatus.Active){
            listView.focus = true;
        }
    }
    onFocusChanged: {
        if(focus) listView.focus = true;
    }           

    ListModel
    {
        id: langsModel
        ListElement{
            modelData: "中文"
            type: "en"
        }
        ListElement{
            modelData: "俄语"
            type: "ru"
        }
    }

    SelectionDialog {
        id: selectionDialog
        titleText: qsTr("选择当前语言")
        model: langsModel
        selectedIndex: getLangID();
    }

    function getHFB2()
    {                            
        return tt1.paintedHeight + ttCB.height + ttLI.height + 4 + platformStyle.paddingLarge*2;
    }

    function getHLang()
    {
        return tt4.paintedHeight + 25 + ttLI.height + 4 + platformStyle.paddingLarge*2;
    }

    function getHLib()
    {                
        return tt2.paintedHeight +  + ttCB.height + ttLI.height + 4 + platformStyle.paddingLarge*2;
    }

    function getHExpImp()
    {
        return tt3.paintedHeight +  + ttCB.height + ttLI.height + 4 + platformStyle.paddingLarge*2;
    }

    Item {
        // non-visible item to calc listDelegate hieght
        ListItemText {
            id: ttLI
            mode: "normal"
            role: "Title"
            text: "一行文本"
        }
        CheckBox{
            id: ttCB
            text: "一行文本"
            anchors.topMargin: platformStyle.paddingMedium
        }
        BookText {
            id: tt1
            font.pointSize: 6
            width: {
                var i = ListView.view ? ListView.view.width : screen.width;
                return i - platformStyle.paddingLarge - privateStyle.scrollBarThickness - platformStyle.paddingMedium;
            }
            horizontalAlignment: Text.AlignJustify
            clip: true            
            text: qsTr("警告：\n只有备注，总长度小于600个字符"
                                        +"\n可以显示在弹出窗口，显示图像是不可能的\n只是一个简单的文本")
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        BookText {
            id: tt2
            font.pointSize: 6
            width: {
                var i = ListView.view ? ListView.view.width : screen.width;
                return i - platformStyle.paddingLarge - privateStyle.scrollBarThickness - platformStyle.paddingMedium;
            }
            horizontalAlignment: Text.AlignJustify
            clip: true            
            text: qsTr("信息:\n当删除一本书时\n从手机中删除源文件(EPUB，FB2，ZIP)")
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        BookText {
            id: tt3
            font.pointSize: 6
            width: {
                var i = ListView.view ? ListView.view.width : screen.width;
                return i - platformStyle.paddingLarge - privateStyle.scrollBarThickness - platformStyle.paddingMedium;
            }
            horizontalAlignment: Text.AlignJustify
            clip: true
            text: qsTr("信息:\n可以加快快速导入\n但不包括从搜索到的归档文件(ZIP)"
                       +"\n然而，并非所有的书都可以导入，如果你只是单一阅读ePub书籍文件\n建议您取消此设置")
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        BookText {
            id: tt4
            font.pointSize: 6
            width: {
                var i = ListView.view ? ListView.view.width : screen.width;
                return i - platformStyle.paddingLarge - privateStyle.scrollBarThickness - platformStyle.graphicSizeSmall - platformStyle.paddingMedium;
            }
            horizontalAlignment: Text.AlignJustify
            clip: true            
            text: qsTr("警告：\n对于这一变化，本程序需要重新启动")
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        visible: false
    }

    Component{
        id: listDelegate
        ListItem{            
            mode: "normal"
            subItemIndicator: (_typ === 5)?true:false
            onClicked: if (_typ === 5) selectionDialog.open();
            onFocusChanged: {
                if(focus){
                    switch(_typ) {
                    case 1:
                        cbUseCSS.focus = true;
                        break;
                    case 2:
                        cbUsePopUp.focus = true;
                        break;
                    case 3:
                        cbDeleteSourceFile.focus = true;
                        break;
                    case 4:
                        cbCheckZipFiles.focus = true;
                        break;
                    }
                }
            }
            height: {
                switch ( _typ) {
                case 1:
                    if(getPaddingHeight() < (cbUseCSS.implicitHeight + 25))
                        return implicitHeight + (cbUseCSS.implicitHeight + 25) - getPaddingHeight();
                    else
                        return implicitHeight;
                case 2: return getHFB2();
                case 3: return getHLib();
                case 4: return getHExpImp();
                default: return getHLang();
                }
            }
            Rectangle {
                visible: _typ === 1
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("ePub选项")
                    }
                    CheckBox{
                        id: cbUseCSS
                        text: qsTr("使用默认")
                        anchors.topMargin: platformStyle.paddingMedium
                        checked: op_useEpubCssDefault
                        onClicked: {op_useEpubCssDefault = !op_useEpubCssDefault;}
                    }
                }
            }
            Rectangle {
                visible: _typ === 2
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    spacing: 2
                    width: parent.width
                    ListItemText {
                        id: titleItemText
                        mode: "normal"
                        role: "Title"
                        text: qsTr("FB2选项")
                    }
                    CheckBox{
                        id: cbUsePopUp
                        text: qsTr("在弹出的窗口显示笔记")
                        anchors.topMargin: platformStyle.paddingMedium
                        checked: op_showFB2NotesInPopUpMode
                        onClicked: {op_showFB2NotesInPopUpMode = !op_showFB2NotesInPopUpMode;}
                    }
                    BookText {                        
                        anchors.topMargin: platformStyle.paddingMedium
                        width: parent.width
                        color: "white"
                        font.pointSize: tt1.font.pointSize
                        text: tt1.text
                        horizontalAlignment: tt1.horizontalAlignment
                        clip: tt1.clip
                        wrapMode: tt1.wrapMode
                    }
                }
            }
            Rectangle {
                visible: _typ === 3
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    width: parent.width
                    spacing: 2
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("库选项")
                    }
                    CheckBox{
                        id: cbDeleteSourceFile
                        text: qsTr("删除源文件")
                        anchors.topMargin: platformStyle.paddingMedium
                        checked: op_delSourceFile
                        onClicked: {op_delSourceFile = !op_delSourceFile;}
                    }
                    BookText {
                        id: text3
                        anchors.topMargin: platformStyle.paddingMedium                        
                        width: parent.width                        
                        color: "white"                        

                        font.pointSize: tt2.font.pointSize
                        text: tt2.text
                        horizontalAlignment: tt2.horizontalAlignment
                        clip: tt2.clip
                        wrapMode: tt2.wrapMode
                    }
                }
            }
            Rectangle {
                visible: _typ === 4
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    width: parent.width
                    spacing: 2
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("快速导入")
                    }
                    CheckBox{
                        id: cbCheckZipFiles
                        text: qsTr("检查zip文件")
                        anchors.topMargin: platformStyle.paddingMedium
                        checked: op_checkZipFiles
                        onClicked: {op_checkZipFiles = !op_checkZipFiles;}
                    }
                    BookText {
                        anchors.topMargin: platformStyle.paddingMedium
                        width: parent.width
                        color: "white"

                        font.pointSize: tt3.font.pointSize
                        text: tt3.text
                        horizontalAlignment: tt3.horizontalAlignment
                        clip: tt3.clip
                        wrapMode: tt3.wrapMode
                    }
                }
            }
            Rectangle {
                id: langRect
                visible: _typ === 5
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    spacing: 2
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: qsTr("语言(用户界面)")
                    }
                    Rectangle{
                        anchors.topMargin: platformStyle.paddingMedium
                        width: langRect.width
                        height: 25
                        color: "#221d1d"
                        radius: 7
                        Text {
                            anchors.centerIn: parent
                            anchors.leftMargin: 10
                            elide: Text.ElideMiddle
                            text: selectionDialog.model.get(selectionDialog.selectedIndex).modelData
                            color:platformStyle.colorNormalMid
                        }
                    }
                    BookText {
                        id: text2
                        anchors.topMargin: platformStyle.paddingMedium
                        color: "white"
                        width: langRect.width
                        font.pointSize: tt4.font.pointSize
                        text: tt4.text
                        horizontalAlignment: tt4.horizontalAlignment
                        clip: tt4.clip
                        wrapMode: tt4.wrapMode
                    }
                }
            }
        }
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
            _typ: 3
        }
        ListElement{
            _typ: 4
        }
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
            onClicked: doOk()
            flat: false
        }
    }
    Component.onCompleted: if(optionsObj.isMultiLanguage)listModel.append({"_typ": 5})
}
