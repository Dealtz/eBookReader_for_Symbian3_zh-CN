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
              + "<p>本软件eBookReader用于阅读FB2， FB2ZIP, EPUB (第2版) 格式的电子书 , 不支持DRM格式。"
              +"<h3>1. 主窗口 (书库)</h3>"
              +"<h4>菜单</h4><ul><li><i>添加书籍</i> - 向书库中导入 (添加) 一本新书。 "
              +"FB2, FB2ZIP 和 EPUB 将被转换成内部的ebr格式。 "
              +"你可以直接导入书籍，或者扫描文件夹或者手机来导入。 "
              +"本软件通过读取生成的ebr文件来呈现书籍。因此当全部导入完成后，你可以删除原文件(epub, fb2, zip)来释放磁盘空间。"
              +"提示，开头为 '.' 的文件夹在快速添加时将被忽略。</li>"
              +"<li><i>软件设置</i> - 打开程序的设置窗口。</li>"
              +"<li><i>编辑书库</i> - 从书库中删除选定的书籍。</li>"
              +"<li><i>关于指南</i> - 查看关于和用户指南。</li>"
              +"<li><i>退出软件</i> - 退出本软件。</li></ul>"
              +"<h4>书库操作</h4>"
              +"<ul><li><i>点击书本</i> - 打开书本。</li>"
              +"<li><i>长按书本</i> - 打开书本菜单。</li></ul>"
              +"<h4>书本菜单</h4>"
              +"<ul><li><i>删除该书</i> - 从程序中删除选择的书本并从磁盘中删除转换来的ebr格式的电子书文件(可设置同时删除原epub,fc2,zip文件)。</li>"
              +"<li><i>开始阅读</i> - 打开书本。在书名后用符号\"<img src=\":/img/tb_sync\" width=16 heigth=16 />\"来标记的书本则会在打开书本时继续完成全部内容的导入。</li>"
              +"<li><i>查看简介</i> - 查看书籍的简介。</li>"
              +"<li><i>编辑详情</i> - 编辑/查看书籍信息，但不是对书籍文件本身进行修改。</li></ul>"
              +"<h3>2. 书本窗口</h3>"
              +"<h4>菜单</h4>"
              +"<ul><li><i>设置</i> - 打开程序的设置菜单。</li>"
              +"<li><i>屏幕</i> - 选择屏幕方向 (竖屏或横屏)。</li>"
              +"<li><i>显示</i> - 选择显示模式(日间模式或夜间模式,隐藏工具栏, 显示状态栏)。(小提示，软件的作者设定的夜间模式和一般的设定正好相反。请根据喜好设定或者到设置中更改)</li>"
              +"<li><i>导航</i> - 查看书籍导航菜单。</li>"
              +"<li><i>书签</i> - 查看书签菜单。</li>"
              +"<li><i>退出</i> - 退出程序</li></ul>"
              +"<h4>书本内容操作</h4>"
              +"<ul><li><i>下箭头键向下翻页 (或触摸屏幕向下滑动)</i> - 进入下一页。</li>"
              +"<li><i>上箭头键向上翻页 (或触摸屏幕向上滑动)</i> - 返回上一页。</li>"
              +"<li><i>使用手势 (双指按住, 向外移动)</i> - 放大内容<br>"
              +"<i>使用手势 (双指按住, 向内移动)</i> - 缩小内容。<br>"
              +"放大和缩小内容的目的是方便点击超链接，"
              +" 调节字体的大小可以获得最佳的阅读效果。</li>"
              +"<li><i>点击图片</i> - 进入图片浏览器。</li>"
              +"<li><i>长按文本</i> - 可以选中文本，通过移动小光标来确定文本范围，再长按选中区域激活文本复制功能。<br>"
              +"如果一个页面内不能呈现所有内容时，请滑动滚动条。(小提示:校对者表示并不能调出滚动条)</li></ul>"
              +"<h3>3. 设置窗口</h3>"
              +"<ul><li><i>更改书籍目录</i> - 更改转换来的ebr书籍文件的保存目录。(不建议更改。如果不更改，若不再使用本软件，删除软件时可以一并删除ebr文件来适释放磁盘空间。)</li>"
              +"<li><i>ePub 选项</i> - 在默认和初始样式间切换。</li>"
              +"<li><i>删除原文件</i> - 在删除书籍时从手机中删除epub, fb2, zip格式原文件。"
              +" 如果不勾选该选项，你从书籍目录中删除书籍，只会删除ebr文件。但是您可以通过保留的原文件(epub, fb2, zip)，重新添加该书籍。</li></ul>"
              +"<h3>4. 书本状态</h3>"
              +"<ul><li>当阅读完书本时，将呈现\"完成\"状态并且不会再改变。</li></ul>"
              +"<ul><li>*在书名后用符号<img src=\":/img/tb_sync\" width=16 heigth=16 />标记的书本表示该书本是通过快速添加得到的，第一次打开时将会继续完书本内容的导入。</li></ul>"
              +"</p></body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
