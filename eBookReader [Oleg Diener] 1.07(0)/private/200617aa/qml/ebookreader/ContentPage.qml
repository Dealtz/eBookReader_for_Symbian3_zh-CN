import QtQuick 1.1
import com.nokia.symbian 1.1
import MyLibrary 1.0
import QtMobility.systeminfo 1.2
import "options.js" as OPTIONS


Page {
    id: contentPage
    property string type: "contentPage"
    property string fileName: ""
    property bool fullScreen: optionsObj.fullScreen
    property bool showStatusBar: optionsObj.showStatusBar
    property bool mustFileOpen: false
    property bool mustOrientationChange: false
    property bool hasLinkBackward: browser.hasLinkBackward
    property bool hasLinkForward: browser.hasLinkForward
    property bool hasLinks: browser.hasLinks
    property bool isRotatable: true

//    Row{
//    Button{
//        id:btnTest
//        anchors.top: parent.top
//        onClicked: contentMenu.open()
//        height: 50
//    }//test
//    Button{
//        id:btnTest2
//        anchors.top: parent.top
//        onClicked: viewLibraryPage()
//        height: 50
//    }//test
//    }

    DeviceInfo{
        id: devInfo
    }

    onStatusChanged: {
        if(status === PageStatus.Active){
            statusBarText.text = browser.title;            
            if(fullScreen){
                if(showStatusBar)
                    window.state = "fullscreen_plus_status";
                else
                    window.state = "fullscreen";
            }else{
                if(!showStatusBar)
                    window.state = "normal_minus_status";
                else
                    window.state = "";
            }
            if(mustFileOpen){
                mustFileOpen = false;
                browser.openFile(fileName);
            }
            focus = true;
        }
    }

    function orientationChangeFinished()
    {
        if(mustOrientationChange)
        {
            mustOrientationChange = false;
            browser.orientationChanged();
        }
    }

    function openFile()
    {
        mustFileOpen = false;
        browser.openFile(fileName);
    }

    function setFileName(fn)
    {
        mustFileOpen = true;
        fileName = fn;
    }

    function setPortrait()
    {
        if(isRotatable){
            mustOrientationChange = orientationLock !== PageOrientation.LockPortrait;
            orientationLock = PageOrientation.LockPortrait;
            if(hasLinks)
                contentPage.state = "my_portrait";
            else
                contentPage.state = "";
        }
    }

    function setLandscape()
    {
        if(isRotatable){
            mustOrientationChange = orientationLock !== PageOrientation.LockLandscape;
            orientationLock = PageOrientation.LockLandscape;
            contentPage.state = "";
        }
    }

    function updateSettings()
    {
        browser.updateSettings();
    }

    function setDarkColors()
    {
        browser.setDarkColors();
    }

    function setDayColors()
    {
        browser.setDayColors();
    }

    function viewIndexPage()
    {
        browser.buildIndexPage();
        if(OPTIONS.indexPageDlg === null)
        {
            var component = Qt.createComponent("IndexPageDialog.qml");
            OPTIONS.indexPageDlg = component.createObject(contentPage);
            if (OPTIONS.indexPageDlg !== null) {
                OPTIONS.indexPageDlg.gotoChapter.connect(gotoChapter);
            }
        }

        if (OPTIONS.indexPageDlg !== null) {
            OPTIONS.indexPageDlg.open();
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

    function gotoChapter(selectedIndex)
    {
        browser.gotoChapter(selectedIndex)
    }

    function viewGotoPage()
    {
        if(OPTIONS.gotoPageDlg === null)
        {
            var component = Qt.createComponent("GotoPageDialog.qml");
            OPTIONS.gotoPageDlg = component.createObject(contentPage, {"totalPages": browser.pageCount, "currentPage": browser.currentPageNo});
            if (OPTIONS.gotoPageDlg !== null) {
                OPTIONS.gotoPageDlg.gotoPage.connect(gotoPage);
            }
        }

        if (OPTIONS.gotoPageDlg !== null) {
            OPTIONS.gotoPageDlg.currentPage = browser.currentPageNo();
            OPTIONS.gotoPageDlg.totalPages = browser.pageCount;
            OPTIONS.gotoPageDlg.open();
        }
    }

    function gotoPage(page_no)
    {
        browser.gotoPage(page_no);
    }

    function viewBookmarkPage()
    {
        if(OPTIONS.gotoBookmarkDlg === null)
        {
            var component = Qt.createComponent("GotoBookmarkDialog.qml");
            OPTIONS.gotoBookmarkDlg = component.createObject(contentPage);
            if (OPTIONS.gotoBookmarkDlg !== null) {
                OPTIONS.gotoBookmarkDlg.gotoBookmark.connect(gotoBookmark);
            }
        }

        if (OPTIONS.gotoBookmarkDlg !== null) {
            OPTIONS.gotoBookmarkDlg.open();
        }
    }

    function viewEditBookmarkPage()
    {
        var p;
        if(pageStack.currentPage.type !== "editBookmarkPage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "editBookmarkPage";});
            if(p){pageStack.push(p);}
            else{pageStack.push(Qt.resolvedUrl("EditBookmarkDialog.qml"));}
        }
    }

    function gotoBookmark(selectedIndex)
    {
        browser.gotoBookmark(selectedIndex);
    }

    function viewNote()
    {
        var note = browser.getNote();
        if(OPTIONS.noteDlg === null)
        {
            var component = Qt.createComponent("NoteViewDialog.qml");
            OPTIONS.noteDlg = component.createObject(contentPage);
            component.destroy();
        }
        if (OPTIONS.noteDlg !== null) {
            OPTIONS.noteDlg.note = note;
            OPTIONS.noteDlg.open();
        }
        browser.clearNote();
    }

    function gotoHref(href)
    {        
        if(browser.gotoHref(href))
            viewNote();
    }

    function isOpened()
    {
        return browser.isOpened;
    }

    function viewBookImage(photoUrl){
        var p;
        if(pageStack.currentPage.type !== "imagePage")
        {
            p = pageStack.find(function(page) {
                                   return page.type === "imagePage";});
            if(p){pageStack.push(p, {"photoUrl": photoUrl});}
            else{pageStack.push(Qt.resolvedUrl("LargeImagePage.qml"), {"photoUrl": photoUrl});}
        }
    }

    function viewLibraryPage(){
        if(OPTIONS.libraryPage === null)
        {
            var component = Qt.createComponent("LibraryPage.qml");
            OPTIONS.libraryPage = component.createObject(pageStack);
            if (OPTIONS.libraryPage !== null) {                
                pageStack.push(OPTIONS.libraryPage);
            }
        }else{pageStack.push(OPTIONS.libraryPage);}
    }

    function setFullScreen()
    {
        fullScreen = !fullScreen;
        if(fullScreen){
            if(showStatusBar)
                window.state = "fullscreen_plus_status";
            else
                window.state = "fullscreen";
        }else{
            if(!showStatusBar)
                window.state = "normal_minus_status";
            else
                window.state = "";
        }
        browser.orientationChanged();
        optionsObj.fullScreen = fullScreen;
    }    

    function setShowStatusBar()
    {
        showStatusBar = !showStatusBar;
        if(fullScreen){
            if(showStatusBar)
                window.state = "fullscreen_plus_status";
            else
                window.state = "fullscreen";
        }else{
            if(!showStatusBar)
                window.state = "normal_minus_status";
            else
                window.state = "";
        }
        browser.orientationChanged();
        optionsObj.showStatusBar = showStatusBar;
    }

    focus: true

    Keys.onUpPressed: if (isOpened()) browser.prevPage()
    Keys.onDownPressed: if(isOpened()) browser.nextPage()
    Keys.onSelectPressed: contentMenu.open()
    Keys.onAsteriskPressed: contentMenu.open()

    BookBrowser {
        id: browser
//        x1: contentPage.x; y1: contentPage.y// +50//test
//        x2: contentPage.width; y2: contentPage.height //- bookStatusButton.height

        anchors.fill: parent
        color: "#000000"; penWidth: 0
        clip: true
        onTitleChanged: {
            if(pageStack.currentPage.type === "contentPage")
                statusBarText.text = browser.title;
        }
        onLinksChanged: {
//            console.debug("isRotatable=" + isRotatable);
            if(browser.hasLinks){
                if(isRotatable)
                    if(contentPage.orientationLock === PageOrientation.LockPortrait)
                        contentPage.state = "my_portrait";
            }else{
                contentPage.state = "";
            }
        }

        PinchArea {
            anchors.fill: parent
            pinch.maximumScale: 5
            pinch.minimumScale: 1
            onPinchStarted: browser.startZoom();
            onPinchUpdated: browser.zoom(pinch.startCenter.x, pinch.startCenter.y, pinch.scale);
            onPinchFinished: {
                browser.finishZoom();
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {browser.mousePressed(mouse.x, mouse.y); }
                onPositionChanged: {browser.mousePosChanged(mouse.x, mouse.y);}
                onClicked: {
                    browser.clicked(mouse.x, mouse.y);
                    if(browser.pic !== ""){
                        viewBookImage(browser.pic);
                    }else if(browser.anchorHref !== ""){
                        gotoHref(browser.anchorHref);                        
                    }
                }
                onPressAndHold:{
                    if(browser.longPressed(mouse.x, mouse.y))
                        copyMenu.open();
                }
            }
        }
        Button{
            visible: browser.isZoomIn
            iconSource: "qrc:/img/tb_zoom_back"
            onClicked: browser.resetZoomIn();
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 2
            anchors.rightMargin: 2
            opacity: 0.8
        }
    }
    ContextMenu {
        id: copyMenu
        MenuLayout {
            MenuItem {
                text: "复制文本"
                onClicked: browser.copySelection()
            }
            MenuItem {
                text: "取消选择"
                onClicked: browser.cancelSelection()
            }
        }
    }
    Menu {
        id: contentMenu
        // define the items in the menu and corresponding actions
        content: MenuLayout {
            MenuItem {
                text: "设置"                
                onClicked: viewSettingsPage()
            }
            MenuItem {
                text: "屏幕"
                platformSubItemIndicator: true
                onClicked: screenMenu.open()
            }
            MenuItem {
                text: "显示"
                platformSubItemIndicator: true
                onClicked: colorsMenu.open()
            }
            MenuItem {
                text: "导航"
                platformSubItemIndicator: true
                onClicked: navigationMenu.open()
                enabled: isOpened()
            }
            MenuItem {
                text: "书签"
                platformSubItemIndicator: true
                onClicked: bookmarkMenu.open()
                enabled: isOpened()
            }
            MenuItem {
                text: "退出"
                onClicked: {
                    Qt.quit();
                }
            }
        }
    }
    ContextMenu {
        id: screenMenu
        MenuLayout {
            MenuItem {
                text: "竖屏"
                onClicked: setPortrait()
            }
            MenuItem {
                text: "横屏"
                onClicked: setLandscape()
            }
        }
    }
    ContextMenu {
        id: colorsMenu
        MenuLayout {
            MenuItemWithCheck {
                checked: fullScreen
                text: "隐藏工具栏"
                onClicked: {
                    checked = !checked;
                    setFullScreen();
                }
            }
            MenuItemWithCheck {
                checked: showStatusBar
                text: "显示状态栏"
                onClicked: {
                    checked = !checked;
                    setShowStatusBar();
                }
            }
            MenuItem {
                text: "日间模式"
                onClicked: setDayColors()
            }
            MenuItem {
                text: "夜间模式"
                onClicked: setDarkColors()
            }
        }
    }
    ContextMenu {
        id: navigationMenu
        MenuLayout {
            MenuItem {
                text: "目录"
                onClicked: viewIndexPage()
            }
            MenuItem {
                text: "转到页码"
                onClicked: viewGotoPage()
            }
            MenuItem {
                text: "查看书签"
                onClicked: viewBookmarkPage()
            }            
            MenuItem {
                text: "首页"
                onClicked: gotoPage(1)
            }
            MenuItem {
                text: "尾页"
                onClicked: gotoPage(browser.pageCount)
            }
            MenuItem {
                text: "返回"
                onClicked: browser.gotoLinkBackward()
                enabled: hasLinkBackward
            }
            MenuItem {
                text: "前进"
                onClicked: browser.gotoLinkForward()
                enabled: hasLinkForward
            }
        }
    }
    ContextMenu {
        id: bookmarkMenu
        MenuLayout {
            MenuItem {
                text: "添加书签"
                onClicked: browser.addBookmark()
            }
            MenuItem {
                text: "查看书签"
                onClicked: viewBookmarkPage()
            }
            MenuItem {
                text: "编辑书签"
                onClicked: viewEditBookmarkPage()
            }
            MenuItem {
                text: "删除全部书签"
                onClicked: browser.deleteBookmarks()
            }
        }
    }

    tools: ToolBarLayout {        
        ToolButton {
            id: backButton
            iconSource: "toolbar-back"
            onClicked: viewLibraryPage()
        }
        ToolButton {
            id: menuToolButton
            iconSource: "toolbar-menu"
            onClicked: contentMenu.open()
            anchors.left: backButton.right
        }
        Label {
            id: bookStatusButton
            text: browser.bookStatus
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottomMargin: 0
            horizontalAlignment: Text.AlignHCenter
        }
        ToolButton {
            id: menuTool1            
            iconSource: "toolbar-mediacontrol-backwards"
            onClicked: browser.gotoLinkBackward()
            anchors.right: menuTool2.left
            enabled: hasLinkBackward
            opacity: hasLinkBackward?1.0:0.3
            visible: hasLinks
        }
        ToolButton {
            id: menuTool2
            iconSource: "toolbar-mediacontrol-forward"
            onClicked: browser.gotoLinkForward()
            anchors.right: upButton.left
            enabled: hasLinkForward
            opacity: hasLinkForward?1.0:0.3
            visible: hasLinks
        }
        ToolButton{
            id: upButton
            iconSource: "qrc:/img/tb_up"
            anchors.right: downButton.left
            onClicked: browser.prevPage()
            enabled: isOpened()
        }
        ToolButton{
            id: downButton
            iconSource: "qrc:/img/tb_down"
            anchors.right: parent.right
            onClicked: browser.nextPage()
            enabled: isOpened()
        }
    }

    states: [
        State {
             name: "my_portrait"
             PropertyChanges { target: bookStatusButton; height: 12}
             PropertyChanges { target: bookStatusButton; font.pixelSize: 12}
             AnchorChanges {
                 target: bookStatusButton
                 anchors.bottom: parent.bottom
             }
         }
    ]

    Component.onCompleted: {
        OPTIONS.isE6 = (devInfo.model === "E6-00");
//        console.debug("model=" + devInfo.model + " isE6=" + OPTIONS.isE6);
        isRotatable = !OPTIONS.isE6;
        if(isRotatable)
            orientationLock = PageOrientation.LockPortrait;
//        else
//            orientationLock = PageOrientation.LockLandscape;
//        console.debug("isRotatable=" + isRotatable);
    }
}
