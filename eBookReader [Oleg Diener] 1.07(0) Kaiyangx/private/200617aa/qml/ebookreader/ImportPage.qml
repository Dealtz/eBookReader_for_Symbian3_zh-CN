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
            text: qsTr("从手机中选择一个文件. 该文件将被完全添加。"
                       +" 添加完成后，你可以删除原文件来释放磁盘空间。");
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
            text: qsTr("从手机或选择的目录中搜索和添加书籍。"
                       +" 只有原数据将被导入，初次打开书本时全部导入。");
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
            text: qsTr("注意: 从文件加载的网页不能自动添加到书库中。"
                       +" 为解决这一问题，请用 \"快速添加\" 或 \"从文件夹添加\" 。");
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        visible: false
    }

    ContextMenu {
        id: importExpressMenu
        MenuLayout {
            MenuItem {
                text: qsTr("从选择目录中添加")
                onClicked: startExpressImport(true);
            }
            MenuItem {
                text: qsTr("从手机中添加")
                onClicked: startExpressImport(false);
            }
        }
    }
    QueryDialog{
        id: msg1
        acceptButtonText: "确认"
        message: qsTr("所有的交易(支付或其他)处理你和销售方的书籍。"
                      + " eBookReader并非是这个过程中的一部分，购买书籍有关的任何问题要向你购买的网站。"
                      +" 仔细检查你的电子书阅读器。")
        titleText: qsTr("警告")
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
                        text: qsTr("从文件夹中添加")
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
                        text: qsTr("快速添加")
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
                        text: qsTr("访问官网")
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
            flat: false
        }
    }

    onFocusChanged: {
        if(focus) listView.focus = true;
    }
}
