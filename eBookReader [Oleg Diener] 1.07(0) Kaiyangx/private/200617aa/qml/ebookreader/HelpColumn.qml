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
        +"<body><h2 align=\"center\">用户指南</h2>"
              + "<p>本软件eBookReader用于阅读FB2， FB2ZIP, EPUB (版本 2) 格式的电子书 , 不支持DRM格式。"
              +"<h3>1. 主窗口 (书库)</h3>"
              +"<h4>菜单</h4><ul><li><i>添加</i> - 向书库中导入 (添加) 一本新书。 "
              +"FB2, FB2ZIP 和 EPUB 将被转换成内部的EBR格式。 "
              +"你可以直接导入书籍，或者从文件夹或者手机中导入。 "
              +"当全部导入完成后，你可以删除源文件来释放磁盘空间。 "
              +"开头为 '.' 的文件夹在快速添加时将被忽略。</li>"
              +"<li><i>设置</i> - 打开程序的设置窗口。</li>"
              +"<li><i>编辑书库</i> - 可以轻易的从书库中删除书本。</li>"
              +"<li><i>用户指南</i> - 查看用户手册和有关程序的信息。</li>"
              +"<li><i>退出</i> - 退出程序</li></ul>"
              +"<h4>书库操作</h4>"
              +"<ul><li><i>短按 本书记录</i> - 打开书本。</li>"
              +"<li><i>长按 本书记录</i> - 打开书本菜单。</li></ul>"
              +"<h4>书本菜单</h4>"
              +"<ul><li><i>删除</i> - 从程序中删除选择的书本并从磁盘中删除EBR格式的电子书文件。</li>"
              +"<li><i>阅读</i> - 打开书本 (开始阅读本书). 若书中有阅读信息将直接链入 - <img src=\":/img/tb_sync\" width=16 heigth=16 />.</li>"
              +"<li><i>注解</i> - 查看书本注解。</li>"
              +"<li><i>详情</i> - 编辑/查看书库条目，你可以编辑书库项目但不是书籍本身。</li></ul>"
              +"<h3>2. 书本窗口</h3>"
              +"<h4>菜单</h4>"
              +"<ul><li><i>设置</i> - 打开程序的设置菜单。</li>"
              +"<li><i>屏幕方向</i> - 选择屏幕方向 (竖屏或横屏)。</li>"
              +"<li><i>显示模式</i> - 选择显示模式(白天模式或夜间模式, 全屏, 等等。</li>"
              +"<li><i>导航</i> - 查看书本导航菜单。</li>"
              +"<li><i>书签</i> - 查看书签菜单。</li>"
              +"<li><i>退出</i> - 退出程序</li></ul>"
              +"<h4>书本内容操作</h4>"
              +"<ul><li><i>下箭头键向下翻页 (或触摸屏幕)</i> - 进入下一页。</li>"
              +"<li><i>上箭头键向上翻页 (或触摸屏幕)</i> - 返回上一页。</li>"
              +"<li><i>使用手势 (2-手指按住, 向外移动)</i> - 放大内容<br>"
              +"<i>使用手势 (2-手指按住, 向内移动)</i> - 缩小内容。<br>"
              +"放大和缩小内容的目的是方便超链接时使用，"
              +" 调节字体的大小可以获得最佳的阅读效果。</li>"
              +"<li><i>点击图片</i> - 进入图片浏览器。</li>"
              +"<li><i>长按文本</i> - 激活文本复制功能。</li></ul>"
              +"如果一个页面内不能呈现所有内容时，请滑动滚动条。"
              +"<h3>3. 设置窗口</h3>"
              +"<ul><li><i>添加书籍目录</i> - 保存已添加书籍目录。</li>"
              +"<li><i>ePub 选项</i> - 默认和初始样式间切换。</li>"
              +"<li><i>删除原文件</i> - 从手机中删除(epub, fb2, zip)格式文件。"
              +" 如果你从书籍目录中删除文件，但是保留了原文件，快速添加功能将会重新添加该文件。</li></ul>"
              +"<h3>4. 书本状态</h3>"
              +"当阅读到书本末尾时，将呈现\"完成\"状态并且不会再改变。"
              +"<ul><li><img src=\":/img/tb_sync\" width=16 heigth=16 /> - 本书未完全添加。</li></ul>"
              +"</p></body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
