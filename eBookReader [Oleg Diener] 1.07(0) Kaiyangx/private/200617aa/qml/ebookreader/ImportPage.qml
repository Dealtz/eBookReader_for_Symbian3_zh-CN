import QtQuick 1.1
import com.nokia.symbian 1.1
import "options.js" as OPTIONS

Page {
    id: groupViewPage

    property string type: "importPage"    

    function addNewBook(){
        bookImporter.startImportNewBook();
    }

    function startExpressImport(fromPath){
        bookImporter.startExpressImport(fromPath);
    }

    function getHImport()
    {

        return tt2.paintedHeight + ttLI.height + platformStyle.paddingLarge * 2 + 2;
    }

    function getHExImport()
    {        
        return tt3.paintedHeight + ttLI.height + platformStyle.paddingLarge * 2 + 2;
    }

    function getHWeb()
    {
        return tt4.paintedHeight + ttLI.height + platformStyle.paddingLarge * 2 + 2;
    }

    Item {
        // non-visible item to calc listDelegate hieght
        ListItemText {
            id: ttLI
            mode: "normal"
            role: "Title"
            text: "One line text"
        }
        BookText {
            id: tt2
            font.pointSize: 6
            width: {
                var i = ListView.view ? ListView.view.width : screen.width;
                return i - platformStyle.paddingLarge - privateStyle.scrollBarThickness - platformStyle.graphicSizeSmall - platformStyle.paddingMedium;
            }
            horizontalAlignment: Text.AlignJustify
            clip: true
            text: "从手机中选择一个文件，该文件将被转换为ebr文件保存在设置的路径中。"
                       +"添加完成后，你可以删除原文件(epub, fb2, zip)来释放磁盘空间(不推荐删除原文件)。";
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        BookText {
            id: tt3
            font.pointSize: 6
            width: {
                var i = ListView.view ? ListView.view.width : screen.width;
                return i - platformStyle.paddingLarge - privateStyle.scrollBarThickness - platformStyle.graphicSizeSmall - platformStyle.paddingMedium;
            }
            horizontalAlignment: Text.AlignJustify
            clip: true
            text: "扫描手机或选择的目录，快速搜索并添加书籍。"
                       +" 只有书本信息被导入，在书名后会用符号\"<img src=\":/img/tb_sync\" width=16 heigth=16 />\"来标记。打开书本时将会继续完成全部内容的导入。";
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
            text: "提示: 从网页上下载的文件不能自动添加到书库中。"
                       +"您需要使用 \"快速添加\" 或 \"添加文件\"将书本手动添加到书库 。";
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        visible: false
    }

    ContextMenu {
        id: importExpressMenu
        MenuLayout {
            MenuItem {
                text: "从文件夹中添加"
                onClicked: startExpressImport(true);
            }
            MenuItem {
                text: "扫描手机以添加"
                onClicked: startExpressImport(false);
            }
        }
    }
    QueryDialog{
        id: msg1
        acceptButtonText: "确认"
        message: "所有书籍的交易都是在您和销售方之间进行的。"
                      + " eBookReader并不参与您购买书籍的过程，购买书籍有关的任何问题请向您选择的网站咨询。"
                      +" eBookReader只是一个本地的电子书阅读器。"
        titleText: "提示"
        onButtonClicked: {
            bookImporter.searchInWeb();
        }
    }

    Component{
        id: listDelegate
        ListItem{
            mode: "normal"
            subItemIndicator: true
            onClicked: {
                switch (_typ){
                case 1: return addNewBook();
                case 2: importExpressMenu.open();
                default :  msg1.open();
                }
            }            
            height: {
                switch ( _typ) {
                case 1: return getHImport();
                case 2: return getHExImport();
                default: return getHWeb();
                }
            }
            Rectangle {
                visible: _typ === 1
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    spacing: 2
                    width: parent.width
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: "添加文件"
                    }
                    BookText {                        
                        anchors.topMargin: platformStyle.paddingMedium
                        font.pointSize: 6
                        width: parent.width
                        text: tt2.text
                        horizontalAlignment: Text.AlignJustify
                        clip: true
                        color: "white"
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
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
                        text: "快速添加"
                    }
                    BookText {
                        anchors.topMargin: platformStyle.paddingMedium
                        font.pointSize: 6
                        width: parent.width
                        text: tt3.text
                        horizontalAlignment: Text.AlignJustify
                        clip: true
                        color: "white"
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }
                }
            }
            Rectangle {
                visible: _typ === 3
                color: "transparent"
                anchors.fill: parent.paddingItem
                Column{
                    spacing: 2
                    width: parent.width
                    ListItemText {
                        mode: "normal"
                        role: "Title"
                        text: "网上下载"
                    }
                    BookText {
                        anchors.topMargin: platformStyle.paddingMedium
                        font.pointSize: 6
                        width: parent.width
                        text: tt4.text
                        horizontalAlignment: Text.AlignJustify
                        clip: true
                        color: "white"
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
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
        }
    }

    onFocusChanged: {
        if(focus) listView.focus = true;
    }
}
