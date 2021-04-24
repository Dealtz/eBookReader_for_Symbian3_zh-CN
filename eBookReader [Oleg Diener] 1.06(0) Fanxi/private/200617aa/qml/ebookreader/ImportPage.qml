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
            text: qsTr("Select a file in the mobile phone. The selected file will be completely imported."
                       +" After the import is complete, you can delete the source file to increase the storage space on a disk.");
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
            text: qsTr("Books are searched and imported from the mobile phone or selected directory."
                       +" Only meta data will be imported, the full import will launched by the first opening of book.");
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        visible: false
    }

    ContextMenu {
        id: importExpressMenu
        MenuLayout {
            MenuItem {
                text: qsTr("Import from a selected directory")
                onClicked: startExpressImport(true);
            }
            MenuItem {
                text: qsTr("Import from the mobile phone")
                onClicked: startExpressImport(false);
            }
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
                default: importExpressMenu.open();
                }
            }            
            height: {
                switch ( _typ) {
                case 1: return getHImport();
                default: return getHExImport();
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
                        text: qsTr("Import from file")
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
                        text: qsTr("Express import")
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
