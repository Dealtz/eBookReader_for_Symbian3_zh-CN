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
        +"<body><h2 align=\"center\">用户手册</h2>"
              + "<p>本程序目前不支持DRM格式的电子书阅读，目前支持: FB2，ZIP，EPUB(第2版)"
              +"<h3>1. 主窗口(图书馆)</h3>"
              +"<h4>菜单</h4><ul><li><i>导入</i> - 导入(添加) 新书到库中"
              +"文件FB2ZIP，FB2，EPUB转换为内部格式EBR"
              +"你可以从手机的文件或文件夹中导入书籍"
              +"全部导入完成后，您可以删除源文件，以增加磁盘上的存储空间"
              +"开头为'.'的文件夹，快速导入的时候将被忽略</li>"
              +"<li><i>设置</i> - 打开程序设置窗口</li>"
              +"<li><i>编辑图书库</i> - 您可以轻松的从图书馆里删除书籍</li>"
              +"<li><i>关于和帮助</i> - 查看用户手册和程序的相关信息</li>"
              +"<li><i>退出</i> - 退出本程序</li></ul>"
              +"<h4>图书馆工作</h4>"
              +"<ul><li><i>短按书籍</i> - 打开这本书籍</li>"
              +"<li><i>长按书籍</i> - 打开这本书的菜单</li></ul>"
              +"<h4>书籍菜单</h4>"
              +"<ul><li><i>删除</i> - 从程序中删除书籍记录和电子书文件(EBR)(不包括书籍的源文件)</li>"
              +"<li><i>阅读</i> - 打开书籍(开始阅读书籍). 导入会自动启动, 如果这本书籍有状态 - <img src=\":/img/tb_sync\" width=16 heigth=16 />.</li>"
              +"<li><i>注释</i> - 查看书籍的注释</li>"
              +"<li><i>详细信息</i> - 编辑/查看库条目，您可以编辑库项目，但不是书本身</li></ul>"
              +"<h3>2. 书籍窗口</h3>"
              +"<h4>菜单</h4>"
              +"<ul><li><i>设置</i> - 打开程序设置窗口</li>"
              +"<li><i>屏幕方向</i> - 选择屏幕方向(横屏或竖屏)</li>"
              +"<li><i>显示模式</i> - 选择显示模式(白天或夜晚，全屏​​等模式)</li>"
              +"<li><i>导航</i> - 查看这本书籍的导航菜单</li>"
              +"<li><i>书签</i> - 查看书籍的书签菜单</li>"
              +"<li><i>退出</i> - 退出本程序</li></ul>"
              +"<h4>使用这本书的内容</h4>"
              +"<ul><li><i>向下箭头或向下滚动内容(触摸屏)</i> - 翻页</li>"
              +"<li><i>向上箭头或向上滚动的内容(触摸屏)</i> - 上一个页面</li>"
              +"<li><i>使用手势(双指向外)</i> - 放大内容<br>"
              +"<i>使用手势(双指向内)</i> - 缩小内容<br>"
              +"用于缩放操作的方便性与超链接"
              +"使用的设置字体，风格显示最佳页面</li>"
              +"<li><i>点击图像</i> - 使用图像浏览器浏览</li>"
              +"<li><i>长按文本</i> - 激活复制文本的功能</li></ul>"
              +"如果内容不能被显示在一个页，滚动条会出现"
              +"<h3>3. 设置窗口</h3>"
              +"<ul><li><i>导入图书目录</i> - 导入书籍文件目录</li>"
              +"<li><i>EPUB选项</i> - 默认情况下，在默认和风格之间切换</li>"
              +"<li><i>删除源文件</i> - 从手机中删除源文件(EPUB，FB2，ZIP)"
              +" 如果从库中删除一本书，但手机里的源文件并未删除，您可以重新导入该书籍文件</li></ul>"
              +"<h3>4. 这本书的状态</h3>"
              +"在阅读到书末的情况下，变化到\"完成\"状态，不会再改变"
              +"<ul><li><img src=\":/img/tb_sync\" width=16 heigth=16 /> - 本书籍未完全导入</li></ul>"
              +"</p></body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
