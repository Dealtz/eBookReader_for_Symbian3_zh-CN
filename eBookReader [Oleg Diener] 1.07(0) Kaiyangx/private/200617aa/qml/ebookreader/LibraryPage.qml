import QtQuick 1.1
import com.nokia.symbian 1.1
import "options.js" as OPTIONS

Page {
    id: libraryPage    
    property string type: "libraryPage"
    property bool isGrouped: false
    property bool useGrid: false
    onStatusChanged: {
        if(status === PageStatus.Active){
            statusBarText.text = "eBookReader";
            window.state = "";
            lw.focus = true
        }
    }

    function viewContentPage()
    {
        var p;
        p = pageStack.find(function(page) {
                               return page.type === "contentPage";});
        if(p){pageStack.pop();}
        else{pageStack.push(contentPage);}
    }

    function addNewBook(){
        bookImporter.startImportNewBook();
    }

    function deleteBook(n){
        bookImporter.deleteBook(n, lw.currentIndex);
    }

    function viewBookAnnotation(n){
        var p;
        if(pageStack.currentPage.type !== "annotationPage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "annotationPage";});
            if(p){pageStack.push(p, {annotation: bookImporter.viewBookAnnotation(n)});}
            else{pageStack.push(Qt.resolvedUrl("AnnotationPage.qml"), {annotation: bookImporter.viewBookAnnotation(n)});}
        }
    }

    function viewBookDetails(n){
        var p;
        if(pageStack.currentPage.type !== "detailPage")
        {
            bookEntry.load(lw.currentIndex);
            p = pageStack.find(function(page) {
                                   return page.type === "detailPage";});
            if(p){pageStack.push(p, {index_: lw.currentIndex});}
            else{pageStack.push(Qt.resolvedUrl("DetailPage.qml"), {index_: lw.currentIndex});}
        }
    }

    function viewInfoPage(){
        var p;
        if(pageStack.currentPage.type !== "infoPage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "infoPage";});
            if(p){pageStack.push(p);}
            else{pageStack.push(Qt.resolvedUrl("InfoPage.qml"));}
        }
    }

    function viewSettingsPage()
    {
        var p;
        if(pageStack.currentPage.type !== "optionsPage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "optionsPage";});
            if(p){pageStack.push(p);}
            else{pageStack.push(Qt.resolvedUrl("Properties.qml"));}
        }
    }

    function closeEditMode()
    {
        bookModel.EditMode = false;
        bookModel.clearSelection();
    }

    function deleteSelected()
    {
        bookModel.deleteSelectedBooks();
    }

    function cancelGrouping()
    {
        bookModel.groupByNothing();
        lw.section.property = "";
        isGrouped = false;
        useGrid = false;
    }

    function indexSelected(n)
    {
        lw.positionViewAtIndex(n, ListView.Beginning);
    }

    function viewGroups()
    {
        var p;
        if(pageStack.currentPage.type !== "groupViewPage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "groupViewPage";});
            if(p){pageStack.push(p, {"useGrid" : useGrid});}
            else{
                pageStack.push(Qt.resolvedUrl("GroupView.qml"), {"useGrid" : useGrid});
                p = pageStack.find(function(page) {
                                       return page.type === "groupViewPage";});
                if(p){
                    p.cancelGrouping.connect(cancelGrouping);
                    p.indexSelected.connect(indexSelected);
                }
            }
        }
    }

    function viewImportPage()
    {
        var p;
        if(pageStack.currentPage.type !== "importPage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "importPage";});
            if(p){pageStack.push(p);}
            else{
                pageStack.push(Qt.resolvedUrl("ImportPage.qml"));
            }
        }
    }

    function openMenu()
    {
        if(bookModel.EditMode) mainEditMenu.open();
        else mainMenu.open();
    }

    ToolBar{
        id: toolbarTop
        anchors.top: parent.top
        ToolButton{
            id: infoButton
            iconSource: "qrc:/img/tb_info"
            flat: false
            onClicked: {
                viewInfoPage();
            }
        }
        ToolButton {
            id: menuGroupingButton
            iconSource: isGrouped?"qrc:/img/tb_groups_open":"toolbar-search"
            onClicked: isGrouped?viewGroups():groupingMenu.open()
            anchors.horizontalCenter: parent.horizontalCenter
            flat: false
        }
//        ToolButton{
//            iconSource: "toolbar-add"
//            anchors.horizontalCenter: parent.horizontalCenter
//            flat: false
//            onClicked: {
//               addNewBook();
//            }
//        }
        ToolButton{
            iconSource: "qrc:/img/tb_quit"
            flat: false
            anchors.right: parent.right
            onClicked: {
                Qt.quit();
            }
        }
    }

    ListView {
        id: lw
        cacheBuffer: 0
        anchors.topMargin: toolbarTop.height
        anchors.fill: parent
        model: bookModel
        delegate: bookDelegate
        clip: true
        Keys.onRightPressed: {            
            libraryPage.focus = true;
        }
        section.delegate: sectionHeading

    }
    ScrollDecorator {
        flickableItem: lw
    }
    // The delegate for each section header
    Component {
        id: sectionHeading
        Rectangle {
            width: lw.width
            height: 18
            color: "lightsteelblue"

            Text {
                anchors.fill: parent
                text: "  " + section
                font.pointSize: 5
                color: "black"
                clip: true
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
    BookItem{
        id: bookDelegate
    }
//    Keys.onSelectPressed: openMenu()
    Keys.onAsteriskPressed: openMenu()
    Keys.onRightPressed: {
        lw.focus = true;
    }
    Keys.enabled: true
    ContextMenu {
        id: groupingMenu
        // define the items in the menu and corresponding actions
        content: MenuLayout {
            MenuItem {
                text: qsTr("按作者分组")
                onClicked: {
                    lw.section.criteria = ViewSection.FullString;
                    lw.section.property = "author";
                    bookModel.groupByAutor();
                    isGrouped = true;
                    useGrid = false;
                }
            }
            MenuItem {
                text: qsTr("按标题分组")
                onClicked: {
                    lw.section.criteria = ViewSection.FirstCharacter;
                    lw.section.property = "name";
                    bookModel.groupByTitle();
                    isGrouped = true;
                    useGrid = true;
                }
            }
            MenuItem {
                text: qsTr("按派别分组")
                onClicked: {
                    lw.section.criteria = ViewSection.FullString;
                    lw.section.property = "genre";
                    bookModel.groupByGenre();
                    isGrouped = true;
                    useGrid = false;
                }
            }
            MenuItem {
                text: qsTr("按日期分组")
                onClicked: {
                    lw.section.criteria = ViewSection.FullString;
                    lw.section.property = "importDate";
                    bookModel.groupByImportDate();
                    isGrouped = true;
                    useGrid = false;
                }
            }
            MenuItem {
                text: qsTr("按状态分组")
                onClicked: {
                    lw.section.criteria = ViewSection.FullString;
                    lw.section.property = "status";
                    bookModel.groupByStatus();
                    isGrouped = true;
                    useGrid = false;
                }
            }
            MenuItem {
                text: qsTr("未分组")
                onClicked: cancelGrouping()
            }
        }
    }
    Menu {
        id: mainMenu
        visible: !lw.model.EditMode
        // define the items in the menu and corresponding actions
        content: MenuLayout {
            MenuItem {
                text: qsTr("添加")
                platformSubItemIndicator: true
                onClicked: viewImportPage()
            }
            MenuItem {
                text: qsTr("设置")                
                onClicked: viewSettingsPage()
            }
            MenuItem {
                text: qsTr("分组按...")
                platformSubItemIndicator: true
                onClicked: groupingMenu.open()
            }
            MenuItem {
                text: qsTr("编辑书库")
                onClicked: {
                    bookModel.EditMode = true;
                }
            }
            MenuItem {
                text: qsTr("用户指南")
                onClicked: viewInfoPage()
            }
           MenuItem {
               text: qsTr("退出")
               onClicked: Qt.quit()
           }
        }
    }

    Menu {
        id: mainEditMenu
        visible: bookModel.EditMode
        // define the items in the menu and corresponding actions
        content: MenuLayout {
            MenuItem {
                text: qsTr("选择全部书签")
                onClicked: bookModel.selectFinishedBooks()
            }
            MenuItem {
                text: qsTr("删除所选书签")
                onClicked: deleteSelected();
            }
            MenuItem {
                text: qsTr("取消选择")
                onClicked: bookModel.clearSelection()
            }
            MenuItem {
                text: qsTr("分组按...")
                onClicked: groupingMenu.open()
            }
            MenuItem {
                text: qsTr("关闭编辑模式")
                onClicked: closeEditMode()
            }
        }
    }
    tools: ToolBarLayout {
        ToolButton {            
            iconSource: "toolbar-back"
            visible: contentPage.isOpened() || bookModel.EditMode
            onClicked: {
                if(bookModel.EditMode) closeEditMode();
                else viewContentPage();
            }
            flat: false
        }
        ToolButton {
            iconSource: bookModel.EditMode?"toolbar-delete":"toolbar-add";
            onClicked: bookModel.EditMode?deleteSelected():addNewBook();
            flat: false
        }
        // add the standard menu button to the toolbar
        ToolButton {
            iconSource: "toolbar-menu"
            onClicked: openMenu()
        }        
    }
    onFocusChanged: {
        if(focus) lw.focus = true;
    }
}
