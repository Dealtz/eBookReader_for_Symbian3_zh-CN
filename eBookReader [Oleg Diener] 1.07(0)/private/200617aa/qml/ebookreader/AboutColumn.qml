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
              +"<body><h3 align=\"center\">eBookReader 版本 1.07(0)</h3>"
              //+"<h3 align=\"center\">Demo-Version</h3>"
              +"<p>版权所有 &copy; 2011-2013 Oleg Diener\n软件汉化、修复乱码、UI修正和添加说明性文字: Dear孜</p>"
              + "<p> e-mail: <a href=\"mailto:info.ebookreader@yahoo.com\">info.ebookreader@yahoo.com</a></p>"
              +"<p>此软件提供的功能即为您所见，不提供任何形式的保证，包括对设计，适销性和特定用途适用性的保证。</p>"
              +"<p>若有意见或建议请发送e-mail到联系邮箱。</p>"
              +"</body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        onLinkActivated:  Qt.openUrlExternally(link);
    }
}
