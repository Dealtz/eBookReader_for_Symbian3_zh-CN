// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

CommonDialog {
    id: gotoPageDialog
    property int currentPage
    property int totalPages
    signal gotoPage( string pageNo )

    titleText: "跳页"
    buttonTexts: ["确认", "取消"]
    privateCloseIcon: true
    height: 200
    content: Item {
        anchors.fill: parent
        TextField {
            id: pagefield
            width: 240
            anchors.centerIn: parent
            text: gotoPageDialog.currentPage
            inputMethodHints: Qt.ImhDigitsOnly;
            validator: IntValidator{bottom: 1; top: gotoPageDialog.totalPages}
         }
        Label {
            anchors.left: pagefield.left;
            anchors.top: pagefield.bottom
            text: "总页码: " + gotoPageDialog.totalPages
            font.pixelSize: platformStyle.fontSizeSmall
         }
    }
    onButtonClicked: if((index === 0) && (pagefield.acceptableInput)) gotoPage(pagefield.text)
}
