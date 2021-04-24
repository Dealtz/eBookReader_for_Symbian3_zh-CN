import QtQuick 1.1
import com.nokia.symbian 1.1

Column {
    id: column
    spacing: 14
    TextEdit {
        id: textEdit
        readOnly: true
        width: parent.width
        color: platformInverted ? platformStyle.colorNormalLightInverted
                                : platformStyle.colorNormalLight
        text: "<html><style type=\"text/css\">p, li { white-space: pre-wrap; } ul {margin: 0; padding: 0}</style></head>"
        +"<body><h2 align=\"center\">User manual</h2>"
              + "<p>The program eBookReader is intended for viewing of eBooks in a formats FB2, FB2ZIP, EPUB (version 2) without DRM support."
              +"<h3>1. Main window (Library)</h3>"
              +"<h4>Menu</h4><ul><li><i>Import</i> - import (add) a new book to the library. "
              +"Files FB2, FB2ZIP and EPUB are converted in an internal format EBR. "
              +"You can import books from a file, a folder or the mobile phone. "
              +"After the full import is complete, you can delete the source files to increase the storage space on a disk. "
              +"The folders beginning with the symbol '.' are ignored by express import.</li>"
              +"<li><i>Settings</i> - open the program settings window.</li>"
              +"<li><i>Edit library</i> - you can easily remove books from the library.</li>"
              +"<li><i>Help and Info</i> - view the user manual and the information about the program.</li>"
              +"<li><i>Exit</i> - exit the program.</li></ul>"
              +"<h4>Working with the library</h4>"
              +"<ul><li><i>A short press on a book record</i> - opens the book.</li>"
              +"<li><i>A long press on a book record</i> - opens the book menu.</li></ul>"
              +"<h4>Book menu</h4>"
              +"<ul><li><i>Delete</i> - delete the selected book from the program and the book file (ebr) from a disk.</li>"
              +"<li><i>Read</i> - open the book (start reading the book). Import will be automatically launched, if the book has status - <img src=\":/img/tb_sync\" width=16 heigth=16 />.</li>"
              +"<li><i>Annotation</i> - view the book annotation.</li>"
              +"<li><i>Details</i> - edit/view the library entry. You can edit the library entry, but not the book itself.</li></ul>"
              +"<h3>2. Book window</h3>"
              +"<h4>Menu</h4>"
              +"<ul><li><i>Settings</i> - open the program settings window.</li>"
              +"<li><i>Screen orientation</i> - select a screen orientation (portrait or landscape).</li>"
              +"<li><i>Display mode</i> - select display mode(in the dark or daylight, full screen, etc.).</li>"
              +"<li><i>Navigation</i> - view the book navigation menu.</li>"
              +"<li><i>Bookmarks</i> - view the book bookmarks menu.</li>"
              +"<li><i>Exit</i> - exit the program.</li></ul>"
              +"<h4>Working with the book content</h4>"
              +"<ul><li><i>Arrow down or scroll down the content (touch screen)</i> - go to next page.</li>"
              +"<li><i>Arrow up or scroll up the content (touch screen)</i> - go to previous page.</li>"
              +"<li><i>Using gestures (2-finger press, move outwards)</i> - zooms into content.<br>"
              +"<i>Using gestures (2-finger press, move inwards)</i> - zooms out of content.<br>"
              +"Zooming is intended for convenience of operation with hyperlinks,"
              +" for the optimum display of the page use the settings for font, style etc.</li>"
              +"<li><i>Click on image</i> - go to image viewer.</li>"
              +"<li><i>A long press on a text</i> - activate the copying text function.</li></ul>"
              +"If a content cannot be displayed on a one page, scroll bars will appear."
              +"<h3>3. Settings window</h3>"
              +"<ul><li><i>Directory for imported books</i> - directory for saving imported book files.</li>"
              +"<li><i>ePub options</i> - switch between the default and original ePub file style sheets.</li>"
              +"<li><i>Delete a original file</i> - remove a source file (epub, fb2, zip) from the phone."
              +" If you delete a book from the library, but keep the original file, the function express import imports the file again.</li></ul>"
              +"<h3>4. Status of the book</h3>"
              +"In case of achievement of the end of the book, the status changes on \"finished\" and more doesn't change."
              +"<ul><li><img src=\":/img/tb_sync\" width=16 heigth=16 /> - the book is not completely imported.</li></ul>"
              +"</p></body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
