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
              +"<body><h3 align=\"center\">eBookReader 版本 1.7</h3>"
              //+"<h3 align=\"center\">Demo-Version</h3>"
              +"<p>版权所有 &copy; 2011-2013 Oleg Diener
© 汉化版权: Kaiyangx</p>"
              + "<p> e-mail: <a href=\"mailto:info.ebookreader@yahoo.com\">info.ebookreader@yahoo.com</a></p>"
              +"<p>本软件不承担任何责任，不得将本软件用于商业用途或者其它特殊用途。</p>"
              +"<p>若有意见或建议发送e-mail.</p>"
              +"</body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        onLinkActivated:  Qt.openUrlExternally(link);
    }
}
