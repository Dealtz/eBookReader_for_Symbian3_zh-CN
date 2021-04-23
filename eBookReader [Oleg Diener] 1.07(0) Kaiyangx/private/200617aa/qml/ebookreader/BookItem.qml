import QtQuick 1.1
import com.nokia.symbian 1.1
import "options.js" as OPTIONS

Component{
    id: bookDelegate

    ListItem{
        id: bookItem        
        onPressAndHold: {
            contentMenu.open();
        }
        onClicked: {
            if(bookModel.EditMode) return;
            if(imgExpressImport.visible){
                bookImporter.startImportBook(lt_idName.text, lt_fileName.text);
            }else{
                contentPage.setFileName(lt_fileName.text);
                pageStack.push(contentPage);
            }
        }

        Item{
            id: internal
            property bool op_marked: marked
            visible: false
            onOp_markedChanged: chBox.checked = op_marked
        }

        ContextMenu {
            id: contentMenu
            visualParent: bookItem
            MenuLayout {
                MenuItem {
                    text: qsTr("Delete")
                    onClicked: libraryPage.deleteBook(lt_idName.text)
                }
                MenuItem {
                    text: qsTr("Read")
                    enabled: !bookModel.EditMode
                    onClicked: {                                            
                        if(imgExpressImport.visible){
                            bookImporter.startImportBook(lt_idName.text, lt_fileName.text);
                        }else{
                            contentPage.setFileName(lt_fileName.text);
                            pageStack.push(contentPage);
                        }
                    }
                }
                MenuItem {
                    text: qsTr("Annotation")
                    onClicked: libraryPage.viewBookAnnotation(lt_fileName.text)
                }
                MenuItem {
                    text: qsTr("Details")
                    onClicked: libraryPage.viewBookDetails(lt_fileName.text)
                }
            }
        }
        Image{
            id: img
            source: "image://covers/" + imageName + ".png"
            anchors.left: parent.paddingItem.left
            anchors.verticalCenter: parent.paddingItem.verticalCenter
        }

        CheckBox{
            id: chBox
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            platformInverted: true
            visible: bookModel.EditMode
            onClicked: bookModel.setMarked(index, checked);
        }

        Rectangle {
            id: lt1
            visible: true
            color: "transparent"

            anchors.fill: parent
            anchors.leftMargin: platformStyle.paddingLarge + img.width + 10
            anchors.rightMargin: privateStyle.scrollBarThickness
            anchors.topMargin: platformStyle.paddingMedium
            anchors.bottomMargin: platformStyle.paddingMedium

            BookText {
                id: lt_1
                text: name
                font.pointSize: 6
                width: parent.width
                clip: true
                elide: Text.ElideMiddle
            }
            BookText {
                id: lt_2
                anchors.top: lt_1.bottom
                text: author
                font.pointSize: 5
                width: parent.width
                clip: true
                elide: Text.ElideMiddle
            }
            Image{
                id: imgExpressImport
                source: "qrc:/img/tb_sync"
                anchors.right: parent.right
                anchors.top: parent.top
                width: 16
                height: 16
                visible: isExpressImport
            }
            BookText {
                id: lt_3
                anchors.top: lt_2.bottom
                text: genre
                font.pointSize: 4
                width: parent.width - lt_4.width
                clip: true
                elide: Text.ElideMiddle
            }
            BookText {
                id: lt_4
                anchors.top: lt_2.bottom
                anchors.right: parent.right
                text: status
                font.pointSize: 4
                textFormat: Text.AlignRight
                clip: true
                elide: Text.ElideMiddle
            }
            Text {
                id: lt_fileName
                text: fileName
                visible: false
            }
            Text {
                id: lt_idName
                text: imageName
                visible: false
            }
        }
    }
}
