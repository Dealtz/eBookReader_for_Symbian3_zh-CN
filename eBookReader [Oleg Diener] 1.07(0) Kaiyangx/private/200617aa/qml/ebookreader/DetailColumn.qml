import QtQuick 1.1
import com.nokia.symbian 1.1

Column {
    id: column
    spacing: platformStyle.paddingMedium
    anchors {
        leftMargin: platformStyle.paddingLarge
        rightMargin: platformStyle.paddingMedium
        topMargin: platformStyle.paddingLarge
        bottomMargin: platformStyle.paddingLarge
    }

    function saveDetails()
    {
        bookEntry.title = titleTextField.text;
        bookEntry.author = authorTextField.text;
        bookEntry.genre = genreTextField.text;
        bookEntry.status = selectionDialog.selectedIndex;
    }

    ListItemText {
        mode: "normal"
        role: "Title"
        text: "标题"
    }
    TextField{
        id: titleTextField
        text: bookEntry.title
        maximumLength: 100
        width: parent.width
        inputMethodHints: Qt.ImhNoPredictiveText;//predictive text switch off//bug 1185 crash on Anna
    }
    ListItemText {
        id: txF1
        mode: "normal"
        role: "Title"
        text: "作者"
    }
    TextField{
        id: authorTextField
        text: bookEntry.author
        maximumLength: 100
        width: parent.width
        inputMethodHints: Qt.ImhNoPredictiveText;
    }
    ListItemText {
        mode: "normal"
        role: "Title"
        text: "类型"
    }
    TextField{
        id: genreTextField
        text: bookEntry.genre
        maximumLength: 100
        width: parent.width
        inputMethodHints: Qt.ImhNoPredictiveText;
    }

    MySelectionItem {
        id: item
        title: "本书状态"
        width: parent.width
        subTitle: selectionDialog.selectedIndex >= 0
                  ? bookEntry.getStatusText(selectionDialog.selectedIndex)
                  : "Please select"

        onClicked: selectionDialog.open()

        SelectionDialog {
            id: selectionDialog
            titleText: "本书状态"
            model: statusModel
            selectedIndex: bookEntry.status
        }
    }

    BookText {
        text: "目录: " + bookEntry.fileName
        width: parent.width
        clip: true
        elide: Text.ElideMiddle
    }
    BookText {
        text: "添加时间: " + bookEntry.importDate
        width: parent.width
        clip: true
        elide: Text.ElideMiddle
    }
    BookText {
        text: "上次阅读: " + bookEntry.lastAccessDate
        width: parent.width
        clip: true
        elide: Text.ElideMiddle
    }
}
