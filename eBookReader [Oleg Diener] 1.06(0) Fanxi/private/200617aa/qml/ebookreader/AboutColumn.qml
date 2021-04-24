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
              +"<body><h2 align=\"center\">关于本应用</h2>"
    +"<h3 align=\"center\">eBookReader<p>版本: 1.6</h3>"
    +"<h3 align=\"center\"><p>开发: Oleg Diener<p>汉化: by Fanxi</p></h3>"
       
        +"<h4 align=\"center\"><p>该应用提供<p>同时也没有任何形式的担保，包括使用后的任何责任，不得将本软件用于商业用途和针对特定用途的使用。</p></h4>"
              +"<h4 align=\"center\"><p>建议或问题，请发送电子邮件至联系地址。</p>"
    + "<p>邮箱:  <a href=\"mailto:info.ebookreader@yahoo.com\">info.ebookreader@yahoo.com</a></p></h4>"       +"<h4 align=\"center\"><p>版权:  &copy; 2011-2013 Oleg Diener</p></h4>"   +"</body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        onLinkActivated:  Qt.openUrlExternally(link);
    }
}
