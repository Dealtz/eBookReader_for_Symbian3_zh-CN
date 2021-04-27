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
            modelData: "中文(含部分英文)"
            type: "en"
        }
        ListElement{
            modelData: "中文(完全翻译)"
            type: "ru"
        }
    }

    SelectionDialog {
        id: selectionDialog
        titleText: "选择当前语言"
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
            text: "One line text"
        }
        CheckBox{
            id: ttCB
            text: "One line text"
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
            text: "警告: 只有总长度小于600字符的Notes"
                                        +"可以显示在弹窗中。无法显示图片，只能显示简单文本。"
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
            text: "提示: 当从书库删除一本书时，将会从手机中删除源文件(epub, fb2, zip)。"
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
            text: "提示: 你可以排除压缩(zip)文件来加速快速添加。"
                       + "然而，并不是所有的书籍都能添加。如果你只阅读ePub电子书，可以取消选中此选项。"
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
            text: "警告: 语言改变将在重启eBookReader后生效。"
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
                        text: "ePub 选项"
                    }
                    CheckBox{
                        id: cbUseCSS
                        text: "使用默认样式"
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
                        text: "FB2 选项"
                    }
                    CheckBox{
                        id: cbUsePopUp
                        text: "弹窗显示Notes"
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
                        text: "书库设置"
                    }
                    CheckBox{
                        id: cbDeleteSourceFile
                        text: "删除原始文件(epub, fb2, zip)"
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
                        text: "快速添加"
                    }
                    CheckBox{
                        id: cbCheckZipFiles
                        text: "扫描zip文件"
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
                        text: "语言 (UI)"
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
        }
    }
    Component.onCompleted: if(optionsObj.isMultiLanguage)listModel.append({"_typ": 5})
}
