import QtQuick 1.1
import com.nokia.symbian 1.1

MyDialog {
    id: dialog
    property int procent
    property bool indeterminateStatus
    property bool importOk
    property string errorText
    property string chapterStatus
    property bool expressImport;
    property bool expImportFinished;
    property string expImportFinishedEndText;

    titleText: expressImport?"快速添加":"正在添加"
    closeAllowed: expressImport?false:true;
    privateCloseIcon: (!importOk) || (expressImport)
    onCloseButtonClicked: closeButtonClicked();

    function closeButtonClicked()
    {
        if(dialog.expressImport){            
            dialog.errorText = "请稍等";
            dialog.importOk = false;
            bookImporter.cancelImport();
        }
    }

    function init(isExpressImport)
    {
        dialog.procent = 0;
        dialog.chapterStatus = "";
        dialog.importOk = true;
        dialog.expressImport = isExpressImport;
        dialog.expImportFinished = false;        
    }

    function importRunning(procent, chapterStatus)
    {
        dialog.indeterminateStatus = false;
        dialog.procent = procent;
        dialog.chapterStatus = chapterStatus;

        if(procent === 100) {
            dialog.indeterminateStatus = true;
        }
    }

    function importEnded(isOk)
    {        
        closeAllowed = true;
        if(dialog.expressImport)
        {
            dialog.indeterminateStatus = false;
            dialog.procent = 100;
            dialog.expImportFinishedEndText = "添加完成";
            dialog.expImportFinished = true;
            dialog.importOk = true;
        }else{
            if(isOk){
                dialog.close();
            }else{
                dialog.errorText = "无法添加文件";
                dialog.importOk = isOk;
            }
        }        
    }

    content: Item {
        anchors.fill: parent

        Column{
            anchors.fill: parent
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
            spacing: 2
            Text{
                anchors.horizontalCenter: pb.horizontalCenter
                text: " "
            }
            ProgressBar {
                anchors.horizontalCenter: parent.horizontalCenter
                id: pb
                indeterminate: indeterminateStatus
                maximumValue: 100
                minimumValue: 0
                value: procent
                visible: true
            }
            Text{
                id: chapterText
                anchors.horizontalCenter: pb.horizontalCenter
                width: parent.width
                text: chapterStatus
                horizontalAlignment: Text.AlignHCenter
                elide: Text.ElideLeft
                color: "white"
                visible: importOk
            }
            Text{
                id: statusText
                anchors.horizontalCenter: pb.horizontalCenter
                text: procent + "%"
                color: "white"
                visible: importOk && (!expImportFinished)
            }
            Text{
                id: statusEndText
                anchors.horizontalCenter: pb.horizontalCenter
                text: expImportFinishedEndText
                color: "white"
                visible: expressImport && expImportFinished
            }
            Text{
                id: statusTextRed
                anchors.horizontalCenter: pb.horizontalCenter
                text: errorText
                color: expressImport?"white":"red"
                visible: !importOk
            }
        }
    }
    Component.onCompleted: {
        bookImporter.importRunning.connect(importRunning);
        bookImporter.importEnded.connect(importEnded);
    }
}
