import QtQuick 1.1
import com.nokia.symbian 1.1

import "options.js" as OPTIONS

Window{
    id: window    

    function viewLibraryPage(){
        if(OPTIONS.libraryPage === null)
        {
            var component = Qt.createComponent("LibraryPage.qml");
            OPTIONS.libraryPage = component.createObject(pageStack);
            if (OPTIONS.libraryPage !== null) {                
                pageStack.push(OPTIONS.libraryPage);
            }
        }else{ pageStack.push(OPTIONS.libraryPage);}
    }

    function showChrome(show) {
        if((window.state != "fullscreen") && (window.state != "fullscreen_plus_status")) return;

        if (show)
            toolbar.visible = true;
        else
            toolbar.visible = false;
    }

    function started(isExpressImport)
    {
        if(OPTIONS.importDlg === null)
        {
            var component = Qt.createComponent("ImportDialog.qml");
            OPTIONS.importDlg = component.createObject(pageStack, {"procent": 0, "importOk": true, "indeterminateStatus": true});
        }

        if (OPTIONS.importDlg !== null) {
            OPTIONS.importDlg.init(isExpressImport);
            OPTIONS.importDlg.open();
        }
    }

    function openImportedBook(fileName)
    {
        contentPage.setFileName(fileName);
        if(pageStack.currentPage !== contentPage)
            pageStack.push(contentPage);
    }

    onOrientationChangeFinished: {
        if(pageStack.currentPage === contentPage){
            contentPage.orientationChangeFinished();
        }
    }

    StatusBar {
        id: statusbar
        anchors.top: parent.top
        clip: true
        visible: true
        Text{
            id: statusBarText
            text: ""
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width / 2
            color: "white"
            clip: true
            elide: Text.ElideMiddle
        }
    }

    HiddenToolbar{
        id: hiddentoolbar
        anchors.bottom: parent.bottom
        visible: false
        onClicked: {
//            console.debug("heddentoolbar2 clicked");
            timer2.start();
            toolbar.visible = true;
        }
    }

    PageStack{
        id: pageStack;
        clip: true        
        ContentPage{
            id: contentPage
            fileName: optionsObj.lastBook
        }
        anchors {
            top: statusbar.bottom;
            left: parent.left;
            right: parent.right;
            bottom: toolbar.top }
        toolBar:  toolbar
    }
    ToolBar{
        id: toolbar
        anchors.bottom: parent.bottom
        visible: true
    }
    Timer {
        id: timer1
        interval: 500; running: false; repeat: false
        onTriggered: contentPage.openFile();
    }
    Timer {
        id: timer2

        interval: 2000
        running: false
        repeat: false

        onTriggered: if (visible) showChrome(false);
    }
    states: [
        State {
             name: "fullscreen"
             PropertyChanges { target: hiddentoolbar; visible: true}
             AnchorChanges {
                 target: pageStack
                 anchors.top: parent.top
                 anchors.bottom: hiddentoolbar.top
             }
             PropertyChanges { target: statusbar; visible: false}
             PropertyChanges { target: toolbar; visible: false}
         },
        State {
             name: "fullscreen_plus_status"
             PropertyChanges { target: statusbar; visible: true}

             PropertyChanges { target: hiddentoolbar; visible: true}
             AnchorChanges {
                 target: pageStack
                 anchors.top: statusbar.bottom
                 anchors.bottom: hiddentoolbar.top
             }
             PropertyChanges { target: toolbar; visible: false}
         },
        State {
             name: "normal_minus_status"
             PropertyChanges { target: toolbar; visible: true}
             AnchorChanges {
                 target: pageStack
                 anchors.top: parent.top
                 anchors.bottom: toolbar.top
             }
             PropertyChanges { target: statusbar; visible: false}
             PropertyChanges { target: hiddentoolbar; visible: false}
         }
    ]
    Component.onCompleted: {
        bookImporter.importStarted.connect(started);
        bookImporter.importOpenTheBook.connect(openImportedBook);

        if(optionsObj.lastBook != ""){
            contentPage.setFileName(optionsObj.lastBook);
            contentPage.mustFileOpen = false;
            pageStack.push(contentPage);
            timer1.start();
        }else{
            viewLibraryPage();
        }                
    }
    MyPopupManager{
        onPopupStackDepth_Changed: {
            if(popupStackDepth_ === 0) pageStack.currentPage.focus = true;
        }
    }
}
