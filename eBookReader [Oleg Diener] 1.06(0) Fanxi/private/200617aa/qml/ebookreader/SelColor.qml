import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: internal

    property string _color: "Red"
    property int _type:  0
    signal selected
    function itemClicked(n)
    {
        _color = n;
        selected();
        pageStack.pop();
    }

    ListModel {
        id: colorsModel
         ListElement {
             name: "艾莉斯蓝"
             colorName: "Aliceblue"
         }
         ListElement {
             name: "古董白"
             colorName: "Antiquewhite"
         }
         ListElement {
             name: "海洋蓝"
             colorName: "Aqua"
         }
         ListElement {
             name: "蓝宝石"
             colorName: "Aquamarine"
         }
         ListElement {
             name: "天空蓝"
             colorName: "Azure"
         }
         ListElement {
             name: "米白色"
             colorName: "Beige"
         }
         ListElement {
             name: "浓郁黄"
             colorName: "Bisque"
         }
         ListElement {
             name: "纯色黑"
             colorName: "Black"
         }
         ListElement {
             name: "杏仁白"
             colorName: "Blanchedalmond"
         }
         ListElement {
             name: "纯色蓝"
             colorName: "Blue"
         }
         ListElement {
             name: "蓝紫美"
             colorName: "Blueviolet"
         }
         ListElement {
             name: "棕红色"
             colorName: "Brown"
         }
         ListElement {
             name: "原木色"
             colorName: "Burlywood"
         }
         ListElement {
             name: "藏青色"
             colorName: "Cadetblue"
         }
         ListElement {
             name: "黄绿色"
             colorName: "Chartreuse"
         }
         ListElement {
             name: "巧克力"
             colorName: "Chocolate"
         }
         ListElement {
             name: "珊瑚橙"
             colorName: "Coral"
         }
         ListElement {
             name: "皇家蓝"
             colorName: "Cornflowerblue"
         }
         ListElement {
             name: "玉米穗黄"
             colorName: "Cornsilk"
         }
         ListElement {
             name: "赤红色"
             colorName: "Crimson"
         }
         ListElement {
             name: "高亮青"
             colorName: "Cyan"
         }
         ListElement {
             name: "深蓝色"
             colorName: "Darkblue"
         }
         ListElement {
             name: "灰绿色"
             colorName: "Darkcyan"
         }
         ListElement {
             name: "深金黄"
             colorName: "Darkgoldenrod"
         }
         ListElement {
             name: "深灰色"
             colorName: "Darkgray"
         }
         ListElement {
             name: "墨绿色"
             colorName: "Darkgreen"
         }         
         ListElement {
             name: "卡其黄"
             colorName: "Darkkhaki"
         }
         ListElement {
             name: "暗洋红"
             colorName: "Darkmagenta"
         }
         ListElement {
             name: "暗绿色"
             colorName: "Darkolivegreen"
         }
         ListElement {
             name: "深橙色"
             colorName: "Darkorange"
         }
         ListElement {
             name: "深兰紫"
             colorName: "Darkorchid"
         }
         ListElement {
             name: "暗红色"
             colorName: "Darkred"
         }
         ListElement {
             name: "深鲑红"
             colorName: "Darksalmon"
         }
         ListElement {
             name: "深海绿"
             colorName: "Darkseagreen"
         }
         ListElement {
             name: "深青蓝"
             colorName: "Darkslateblue"
         }
         ListElement {
             name: "深青灰"
             colorName: "Darkslategray"
         }
         ListElement {
             name: "墨绿色"
             colorName: "Darkturquoise"
         }
         ListElement {
             name: "深紫色"
             colorName: "Darkviolet"
         }
         ListElement {
             name: "深粉红"
             colorName: "Deeppink"
         }
         ListElement {
             name: "深天蓝"
             colorName: "Deepskyblue"
         }
         ListElement {
             name: "黑灰色"
             colorName: "Dimgray"
         }         
         ListElement {
             name: "宝蓝色"
             colorName: "Dodgerblue"
         }
         ListElement {
             name: "火砖色"
             colorName: "Firebrick"
         }
         ListElement {
             name: "花白色"
             colorName: "Floralwhite"
         }
         ListElement {
             name: "森林绿"
             colorName: "Forestgreen"
         }
         ListElement {
             name: "紫红色"
             colorName: "Fuchsia"
         }
         ListElement {
             name: "亮灰色"
             colorName: "Gainsboro"
         }
         ListElement {
             name: "幽灵白"
             colorName: "Ghostwhite"
         }
         ListElement {
             name: "金黄色"
             colorName: "Gold"
         }
         ListElement {
             name: "金菊黄"
             colorName: "Goldenrod"
         }
         ListElement {
             name: "纯灰色"
             colorName: "Gray"
         }
         ListElement {
             name: "纯绿色"
             colorName: "Green"
         }
         ListElement {
             name: "黄绿色"
             colorName: "Greenyellow"
         }
         ListElement {
             name: "浅蜜色"
             colorName: "Honeydew"
         }
         ListElement {
             name: "亮粉红"
             colorName: "Hotpink"
         }
         ListElement {
             name: "印第安红"
             colorName: "Indianred"
         }
         ListElement {
             name: "靛青色"
             colorName: "Indigo"
         }
         ListElement {
             name: "象牙色"
             colorName: "Ivory"
         }
         ListElement {
             name: "土黄色"
             colorName: "Khaki"
         }
         ListElement {
             name: "薰衣草"
             colorName: "Lavender"
         }
         ListElement {
             name: "淡紫红"
             colorName: "Lavenderblush"
         }
         ListElement {
             name: "草绿色"
             colorName: "Lawngreen"
         }
         ListElement {
             name: "粉黄色"
             colorName: "Lemonchiffon"
         }
         ListElement {
             name: "浅蓝色"
             colorName: "Lightblue"
         }
         ListElement {
             name: "浅珊瑚红"
             colorName: "Lightcoral"
         }
         ListElement {
             name: "浅青绿"
             colorName: "Lightcyan"
         }
         ListElement {
             name: "浅金黄"
             colorName: "Lightgoldenrodyellow"
         }
         ListElement {
             name: "浅灰色"
             colorName: "Lightgray"
         }
         ListElement {
             name: "浅绿色"
             colorName: "Lightgreen"
         }
         ListElement {
             name: "浅粉红"
             colorName: "Lightpink"
         }
         ListElement {
             name: "浅橙红"
             colorName: "Lightsalmon"
         }
         ListElement {
             name: "海藻绿"
             colorName: "Lightseagreen"
         }
         ListElement {
             name: "浅天蓝"
             colorName: "Lightskyblue"
         }
         ListElement {
             name: "浅青灰"
             colorName: "Lightslategray"
         }
         ListElement {
             name: "淡钢蓝"
             colorName: "Lightsteelblue"
         }
         ListElement {
             name: "淡黄色"
             colorName: "Lightyellow"
         }
         ListElement {
             name: "青橙绿"
             colorName: "Lime"
         }
         ListElement {
             name: "石灰绿"
             colorName: "Limegreen"
         }
         ListElement {
             name: "纯白色"
             colorName: "Linen"
         }
         ListElement {
             name: "洋红色"
             colorName: "Magenta"
         }
         ListElement {
             name: "褐红色"
             colorName: "Maroon"
         }
         ListElement {
             name: "中碧藍"
             colorName: "Mediumaquamarine"
         }
         ListElement {
             name: "中蓝色"
             colorName: "Mediumblue"
         }
         ListElement {
             name: "中兰花紫"
             colorName: "Mediumorchid"
         }
         ListElement {
             name: "中紫色"
             colorName: "Mediumpurple"
         }
         ListElement {
             name: "中海藻绿"
             colorName: "Mediumseagreen"
         }
         ListElement {
             name: "中青蓝"
             colorName: "Mediumslateblue"
         }
         ListElement {
             name: "中嫩绿"
             colorName: "Mediumspringgreen"
         }
         ListElement {
             name: "中粉蓝"
             colorName: "Mediumturquoise"
         }
         ListElement {
             name: "中紫罗兰红"
             colorName: "Mediumvioletred"
         }
         ListElement {
             name: "深夜蓝"
             colorName: "Midnightblue"
         }
         ListElement {
             name: "薄荷色"
             colorName: "Mintcream"
         }
         ListElement {
             name: "雾中玫瑰"
             colorName: "Mistyrose"
         }
         ListElement {
             name: "鹿皮色"
             colorName: "Moccasin"
         }
         ListElement {
             name: "印地安黄"
             colorName: "Navajowhite"
         }
         ListElement {
             name: "海军蓝"
             colorName: "Navy"
         }
         ListElement {
             name: "旧布黄"
             colorName: "Oldlace"
         }
         ListElement {
             name: "橄榄褐"
             colorName: "Olive"
         }
         ListElement {
             name: "深绿褐"
             colorName: "Olivedrab"
         }
         ListElement {
             name: "焦橙色"
             colorName: "Orange"
         }
         ListElement {
             name: "橙红色"
             colorName: "Orangered"
         }
         ListElement {
             name: "兰紫红"
             colorName: "Orchid"
         }
         ListElement {
             name: "淡金黄"
             colorName: "Palegoldenrod"
         }
         ListElement {
             name: "淡绿色"
             colorName: "Palegreen"
         }
         ListElement {
             name: "淡蓝绿"
             colorName: "Paleturquoise"
         }
         ListElement {
             name: "浅紫红"
             colorName: "Palevioletred"
         }
         ListElement {
             name: "粉木瓜橙"
             colorName: "Papayawhip"
         }
         ListElement {
             name: "粉桃红"
             colorName: "Peachpuff"
         }
         ListElement {
             name: "秘鲁色"
             colorName: "Peru"
         }
         ListElement {
             name: "粉红色"
             colorName: "Pink"
         }
         ListElement {
             name: "暗红紫"
             colorName: "Plum"
         }
         ListElement {
             name: "火药蓝"
             colorName: "Powderblue"
         }
         ListElement {
             name: "纯紫色"
             colorName: "Purple"
         }
         ListElement {
             name: "纯红色"
             colorName: "Red"
         }
         ListElement {
             name: "玫瑰褐"
             colorName: "Rosybrown"
         }
         ListElement {
             name: "宝蓝色"
             colorName: "Royalblue"
         }
         ListElement {
             name: "马鞍棕色"
             colorName: "Saddlebrown"
         }
         ListElement {
             name: "鲜肉色"
             colorName: "Salmon"
         }
         ListElement {
             name: "黄褐色"
             colorName: "Sandybrown"
         }
         ListElement {
             name: "海洋绿"
             colorName: "Seagreen"
         }
         ListElement {
             name: "海贝色"
             colorName: "Seashell"
         }
         ListElement {
             name: "纯蓝色"
             colorName: "Sienna"
         }
         ListElement {
             name: "北极银"
             colorName: "Silver"
         }
         ListElement {
             name: "天蓝色"
             colorName: "Skyblue"
         }
         ListElement {
             name: "石青蓝"
             colorName: "Slateblue"
         }
         ListElement {
             name: "岩石灰"
             colorName: "Slategray"
         }
         ListElement {
             name: "石灰白"
             colorName: "Snow"
         }
         ListElement {
             name: "春绿色"
             colorName: "Springgreen"
         }
         ListElement {
             name: "钢青色"
             colorName: "Steelblue"
         }
         ListElement {
             name: "棕褐色"
             colorName: "Tan"
         }
         ListElement {
             name: "兰绿色"
             colorName: "Teal"
         }
         ListElement {
             name: "紫蓟色"
             colorName: "Thistle"
         }
         ListElement {
             name: "番茄红"
             colorName: "Tomato"
         }
         ListElement {
             name: "绿松石"
             colorName: "Turquoise"
         }
         ListElement {
             name: "紫罗兰"
             colorName: "Violet"
         }
         ListElement {
             name: "麦黄色"
             colorName: "Wheat"
         }
         ListElement {
             name: "黄白色"
             colorName: "White"
         }
         ListElement {
             name: "烟白色"
             colorName: "Whitesmoke"
         }
         ListElement {
             name: "天真黄"
             colorName: "Yellow"
         }
         ListElement {
             name: "叶脉绿"
             colorName: "Yellowgreen"
         }
    }

    ListView {
        id: listView
        anchors.fill: parent
//        anchors.bottomMargin: bar1.height
        clip: true
        model: colorsModel
        delegate: listDelegate
    }

    ScrollDecorator {
        flickableItem: listView
    }
    Component {
        id: listDelegate
        ListItem {
            id: listItem
            onClicked: internal.itemClicked(colorName)
            Row {
                anchors.fill: listItem.paddingItem

                Rectangle{
                    width: 40
                    height: 40
                    color: colorName
                    border.width: 1
                    radius: 5
                    border.color: "Lime"
                }

                ListItemText {
                    mode: listItem.mode
                    role: "Title"
                    text: "  " + name
                }
            }
        }
    }
    onStatusChanged: {
        if (status === PageStatus.Active) {
            listView.focus = true
        }
    }
    onFocusChanged: {
        if(focus) listView.focus = true;
    }
    tools:
        ToolBarLayout {
        backButton: true
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: pageStack.pop()
            flat: false
        }
    }
}
