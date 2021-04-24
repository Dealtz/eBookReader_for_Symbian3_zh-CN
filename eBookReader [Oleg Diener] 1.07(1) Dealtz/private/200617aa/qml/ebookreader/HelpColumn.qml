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
              + "<p>eBookReader是用来浏览fb2,fb2zip,epub(第2版)格式的电子书的软件，不支持DRM格式。"
              +"<h3>1.主窗口(书库)</h3>"
              +"<h4>菜单</h4><ul><li><i>导入书籍</i> - 导入(添加)一本新书到书库中。"
              +"fb2,fb2zip和epub格式文件会被转换成软件内部使用的ebr格式文件。"
              +"您可以直接导入书籍文件，也可以扫描文件夹或者手机来导入。"
              +"本软件通过读取生成的内部ebr文件来打开书籍，因此在导入完成后您可以删除原文件(epub,fb2,zip)来增加磁盘空间。"
              +"提示，命名以'.'开头的文件夹将在快速导入时被忽略。</li>"
              +"<li><i>软件设置</i> - 打开软件的设置窗口。</li>"
              +"<li><i>编辑书库</i> - 您可以便捷地删除选定的书籍。</li>"
              +"<li><i>关于手册</i> - 查看‘关于软件’和‘用户手册’。</li>"
              +"<li><i>退出软件</i> - 退出本软件。</li></ul>"
              +"<h4>书库操作</h4>"
              +"<ul><li><i>轻按书籍</i> - 打开这本书。</li>"
              +"<li><i>长按书籍</i> - 打开书籍的菜单。</li></ul>"
              +"<h4>书籍菜单</h4>"
              +"<ul><li><i>删除书籍</i> - 从软件中删除该书并且从设置的目录下删除转换得来的内部ebr文件。(可设置同时删除原文件：epub,fb2,zip)</li>"
              +"<li><i>开始阅读</i> - 打开书本。在书名后用符号\"<img src=\":/img/tb_sync\" width=16 heigth=16 />\"标记状态的书本则会在打开书本时继续完成全部内容的导入。</li>"
              +"<li><i>查看简介</i> - 查看书籍的简介。</li>"
              +"<li><i>编辑详情</i> - 编辑/查看书籍信息。编辑只是对书库显示有效，不是对书籍文件本身进行修改。</li></ul>"
              +"<h3>2.阅读窗口</h3>"
              +"<h4>菜单</h4>"
              +"<ul><li><i>设置</i> - 打开软件的设置窗口。</li>"
              +"<li><i>屏幕</i> - 选择屏幕方向(竖屏或横屏)。</li>"
              +"<li><i>显示</i> - 选择显示模式(暗色主题/亮色主题，隐藏工具栏，显示状态栏)</li>"
              +"<li><i>导航</i> - 查看书籍的导航菜单。</li>"
              +"<li><i>书签</i> - 查看书籍的书签菜单。</li>"
              +"<li><i>退出</i> - 退出本软件。</li></ul>"
              +"<h4>书籍内容操作</h4>"
              +"<ul><li><i>点击箭头\"<img src=\":/img/tb_down\" width=16 heigth=16 />\"或触摸屏幕向下滑动内容</i> - 前往下一页。</li>"
              +"<li><i>点击箭头\"<img src=\":/img/tb_up\" width=16 heigth=16 />\"或触摸屏幕向下滑动内容</i> - 返回上一页。</li>"
              +"<li><i>使用手势(双指按压向外移动)</i> - 拉近放大内容。<br>"
              +"<i>使用手势(双指按压向内移动)</i> - 拉远缩小内容。<br>"
              +"缩放是为了能方便地点击超链接，"
              +"为了显示最佳请使用设置中的字体和风格等设置项目进行调整。</li>"
              +"<li><i>点击图片</i> - 前往图片查看器。</li>"
              +"<li><i>长按内容</i> - 选中文本内容，并通过移动小光标来确定范围，再长按启动文本复制功能。</li></ul>"
              +"如果一个页面不能显示全部内容，滚动条将会自动出现。（汉化者：尝试很多次，并不能调出滚动条。）"
              +"<h3>3.设置窗口</h3>"
              +"<ul><li><i>ebr文件存放目录</i> - 管理导入书籍时存放ebr文件的目录。(汉化者：不建议更改。如果不更改，则在删除软件时可以一并删除该软件生成的全部ebr文件来增加磁盘空间。)</li>"
              +"<li><i>ePub选项</i> - 在默认和原始ePub风格之间切换。</li>"
              +"<li><i>删除原文件</i> - 从手机中删除原文件(epub,fb2,zip)"
              +"如果不勾选该选项，您从书库中删除书籍，就只会删除软件内部ebr文件。但是您可以通过保留的原文件(epub,fb2,zip)，重新添加该书籍。</li></ul>"
              +"<h3>4. 书本状态</h3>"
              +"<ul><li><i>符号</i><img src=\":/img/tb_sync\" width=16 heigth=16 /> - 在书名后用该符号标记的书本表示它是通过快速导入得到的。它表示的状态为未完全导入。第一次打开时将会继续完书本内容的导入。第一次打开时将会继续完成书本内容的导入。</li>"
              +"<li><i>书本状态</i> - 一共有New（全新）、In progress（阅读中）和Finished（完成）三个状态。当阅读到书本最后一页时，将从‘In progress阅读中’转变为‘Finished完成’，这个状态不会因为您再进入书本先前的页面而再次改变。若要改变状态，请长按书籍进入‘编辑详情’进行修改。</li></ul>"
              +"</p></body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
