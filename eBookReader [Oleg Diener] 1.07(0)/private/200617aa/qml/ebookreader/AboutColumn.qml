import QtQuick 1.1
import com.nokia.symbian 1.1

Column {
    id: column
    spacing: 14

    Text {
        id: textEdit
//        readOnly: true
        textFormat: Text.RichText
        width: parent.width
        color: platformInverted ? platformStyle.colorNormalLightInverted
                                : platformStyle.colorNormalLight
        text: "<html><style type=\"text/css\">p, li { white-space: pre-wrap; } ul, li {margin: 0; padding: 0}</style></head>"
              +"<body><h3 align=\"center\">eBookReader Version 1.7</h3>"
              //+"<h3 align=\"center\">Demo-Version</h3>"
              +"<p>Copyright &copy; 2011-2013 Oleg Diener</p>"
              + "<p> e-mail: <a href=\"mailto:info.ebookreader@yahoo.com\">info.ebookreader@yahoo.com</a></p>"
              +"<p>The program is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.</p>"
              +"<p>Suggestions or by problems, please send e-mail to the contact address.</p>"
              +"</body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        onLinkActivated:  Qt.openUrlExternally(link);
    }
}
