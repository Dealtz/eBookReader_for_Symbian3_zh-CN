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
            text: "从手机中选择一个文件，该文件将被完全导入装换成ebr文件保存在设置的目录中。"
                       +"在导入完成后，你可以你可以删除原文件(epub,fb2,zip)来释放磁盘空间(不推荐删除原文件)";
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
            text: "快速搜索扫描指定文件夹或者整个手机来添加书本。"
                       +"只有书本信息被导入，在书名后会用符号\"<img src=\":/img/tb_sync\" width=16 heigth=16 />\"来标记。第一次打开书本时将会继续完成全部内容的导入。";
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
            text: "提示: 从网页上下载的文件不能自动导入到书库中。"
                       +"解决办法是使用 \"添加文件\" 或 \"快速导入\"将书本手动添加到书库。";
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        visible: false
    }

    ContextMenu {
        id: importExpressMenu
        MenuLayout {
            MenuItem {
                text: "从文件夹中快速导入"
                onClicked: startExpressImport(true);
            }
            MenuItem {
                text: "扫描手机来快速导入"
                onClicked: startExpressImport(false);
            }
        }
    }
    QueryDialog{
        id: msg1
        acceptButtonText: "Ok"
        message: "所有的交易和支付都是在您和书本销售方之间进行的。"
                      + "eBookReader并不参与您购买书籍的过程，和购买书籍有关的任何问题请向您直接向购买书籍的网站咨询。"
                      +"请务必再次确认你购买的书籍能够被你的电子书阅读器打开。"
        titleText: "警告"
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
                        text: "导入文件"
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
                        text: "快速导入"
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
                        text: "上网寻找"
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
            //flat: false
        }
    }

    onFocusChanged: {
        if(focus) listView.focus = true;
    }
}
