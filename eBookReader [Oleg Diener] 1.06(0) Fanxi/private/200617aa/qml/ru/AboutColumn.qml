import QtQuick 1.1
import com.nokia.symbian 1.1

Column {
    id: column
    spacing: 14

    Text {
        id: textEdit
        textFormat: Text.RichText
        width: parent.width
        color: platformInverted ? platformStyle.colorNormalLightInverted
                                : platformStyle.colorNormalLight
        text: "<html><style type=\"text/css\">p, li { white-space: pre-wrap; } ul, li {margin: 0; padding: 0}</style></head>"
        +"<body><h3 align=\"center\">eBookReader Version 1.6</h3>"
              +"<p>Copyright &copy; 2011-2013 Oleg Diener</p>"
              + "<p> e-mail: <a href=\"mailto:info.ebookreader@yahoo.com\">info.ebookreader@yahoo.com</a></p>"
              +"<p>Программа предоставляется \"КАК ЕСТЬ\" без ГАРАНТИЙ ЛЮБОГО РОДА, в том числе ГАРАНТИИ ТОВАРНОГО СОСТОЯНИЯ ПРИ ПРОДАЖЕ и ПРИГОДНОСТИ ДЛЯ ИСПОЛЬЗОВАНИЯ В КОНКРЕТНЫХ ЦЕЛЯХ.</p>"
              +"<p>С предложениями или при возникновении проблем, обращайтесь по вышеуказанному адресу.</p>"
              +"</body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        onLinkActivated:  Qt.openUrlExternally(link);
    }
}
