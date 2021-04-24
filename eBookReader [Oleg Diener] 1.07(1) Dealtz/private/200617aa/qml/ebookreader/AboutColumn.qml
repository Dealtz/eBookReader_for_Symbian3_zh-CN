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
              +"<body><h3 align=\"center\">eBookReader 版本 1.7.1</h3>"
              +"<p>版权所有 © 2011-2016 Oleg Diener</p>"
              + "<p> e-mail: <a href=\"mailto:info.ebookreader@yahoo.com\">info.ebookreader@yahoo.com</a></p>"
              +"<p>本软件不提供任何担保，包括软件的设计、商业和其他特定用途。</p>"
              +"<p>建议和问题请发送邮件到上述地址。</p>"
              +"<p>软件汉化：Dear孜\n书籍状态、颜色名称和对齐方式的弹出框未汉化；\n修正了汉化文本乱码的问题；\n按钮边框(丑)全部去除；\n高级设置里增加了保存设置的按钮；\n部分翻译在尊重原文的基础上结合本人使用经验增加大量说明性文字；\n用户手册里加入个人吐槽。</p>"
              +"<p>汉化反馈：百度贴吧/久智网 @Dear孜</p>"
              +"</body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        onLinkActivated:  Qt.openUrlExternally(link);
    }
}
