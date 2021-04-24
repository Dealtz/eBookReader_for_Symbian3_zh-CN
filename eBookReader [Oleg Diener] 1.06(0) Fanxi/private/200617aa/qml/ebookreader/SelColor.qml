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
             name: "Aliceblue"
             colorName: "Aliceblue"
         }
         ListElement {
             name: "Antiquewhite"
             colorName: "Antiquewhite"
         }
         ListElement {
             name: "Aqua"
             colorName: "Aqua"
         }
         ListElement {
             name: "Aquamarine"
             colorName: "Aquamarine"
         }
         ListElement {
             name: "Azure"
             colorName: "Azure"
         }
         ListElement {
             name: "Beige"
             colorName: "Beige"
         }
         ListElement {
             name: "Bisque"
             colorName: "Bisque"
         }
         ListElement {
             name: "Black"
             colorName: "Black"
         }
         ListElement {
             name: "Blanchedalmond"
             colorName: "Blanchedalmond"
         }
         ListElement {
             name: "Blue"
             colorName: "Blue"
         }
         ListElement {
             name: "Blueviolet"
             colorName: "Blueviolet"
         }
         ListElement {
             name: "Brown"
             colorName: "Brown"
         }
         ListElement {
             name: "Burlywood"
             colorName: "Burlywood"
         }
         ListElement {
             name: "Cadetblue"
             colorName: "Cadetblue"
         }
         ListElement {
             name: "Chartreuse"
             colorName: "Chartreuse"
         }
         ListElement {
             name: "Chocolate"
             colorName: "Chocolate"
         }
         ListElement {
             name: "Coral"
             colorName: "Coral"
         }
         ListElement {
             name: "Cornflowerblue"
             colorName: "Cornflowerblue"
         }
         ListElement {
             name: "Cornsilk"
             colorName: "Cornsilk"
         }
         ListElement {
             name: "Crimson"
             colorName: "Crimson"
         }
         ListElement {
             name: "Cyan"
             colorName: "Cyan"
         }
         ListElement {
             name: "Darkblue"
             colorName: "Darkblue"
         }
         ListElement {
             name: "Darkcyan"
             colorName: "Darkcyan"
         }
         ListElement {
             name: "Darkgoldenrod"
             colorName: "Darkgoldenrod"
         }
         ListElement {
             name: "Darkgray"
             colorName: "Darkgray"
         }
         ListElement {
             name: "Darkgreen"
             colorName: "Darkgreen"
         }         
         ListElement {
             name: "Darkkhaki"
             colorName: "Darkkhaki"
         }
         ListElement {
             name: "Darkmagenta"
             colorName: "Darkmagenta"
         }
         ListElement {
             name: "Darkolivegreen"
             colorName: "Darkolivegreen"
         }
         ListElement {
             name: "Darkorange"
             colorName: "Darkorange"
         }
         ListElement {
             name: "Darkorchid"
             colorName: "Darkorchid"
         }
         ListElement {
             name: "Darkred"
             colorName: "Darkred"
         }
         ListElement {
             name: "Darksalmon"
             colorName: "Darksalmon"
         }
         ListElement {
             name: "Darkseagreen"
             colorName: "Darkseagreen"
         }
         ListElement {
             name: "Darkslateblue"
             colorName: "Darkslateblue"
         }
         ListElement {
             name: "Darkslategray"
             colorName: "Darkslategray"
         }
         ListElement {
             name: "Darkturquoise"
             colorName: "Darkturquoise"
         }
         ListElement {
             name: "Darkviolet"
             colorName: "Darkviolet"
         }
         ListElement {
             name: "Deeppink"
             colorName: "Deeppink"
         }
         ListElement {
             name: "Deepskyblue"
             colorName: "Deepskyblue"
         }
         ListElement {
             name: "Dimgray"
             colorName: "Dimgray"
         }         
         ListElement {
             name: "Dodgerblue"
             colorName: "Dodgerblue"
         }
         ListElement {
             name: "Firebrick"
             colorName: "Firebrick"
         }
         ListElement {
             name: "Floralwhite"
             colorName: "Floralwhite"
         }
         ListElement {
             name: "Forestgreen"
             colorName: "Forestgreen"
         }
         ListElement {
             name: "Fuchsia"
             colorName: "Fuchsia"
         }
         ListElement {
             name: "Gainsboro"
             colorName: "Gainsboro"
         }
         ListElement {
             name: "Ghostwhite"
             colorName: "Ghostwhite"
         }
         ListElement {
             name: "Gold"
             colorName: "Gold"
         }
         ListElement {
             name: "Goldenrod"
             colorName: "Goldenrod"
         }
         ListElement {
             name: "Gray"
             colorName: "Gray"
         }
         ListElement {
             name: "Green"
             colorName: "Green"
         }
         ListElement {
             name: "Greenyellow"
             colorName: "Greenyellow"
         }
         ListElement {
             name: "Honeydew"
             colorName: "Honeydew"
         }
         ListElement {
             name: "Hotpink"
             colorName: "Hotpink"
         }
         ListElement {
             name: "Indianred"
             colorName: "Indianred"
         }
         ListElement {
             name: "Indigo"
             colorName: "Indigo"
         }
         ListElement {
             name: "Ivory"
             colorName: "Ivory"
         }
         ListElement {
             name: "Khaki"
             colorName: "Khaki"
         }
         ListElement {
             name: "Lavender"
             colorName: "Lavender"
         }
         ListElement {
             name: "Lavenderblush"
             colorName: "Lavenderblush"
         }
         ListElement {
             name: "Lawngreen"
             colorName: "Lawngreen"
         }
         ListElement {
             name: "Lemonchiffon"
             colorName: "Lemonchiffon"
         }
         ListElement {
             name: "Lightblue"
             colorName: "Lightblue"
         }
         ListElement {
             name: "Lightcoral"
             colorName: "Lightcoral"
         }
         ListElement {
             name: "Lightcyan"
             colorName: "Lightcyan"
         }
         ListElement {
             name: "Lightgoldenrodyellow"
             colorName: "Lightgoldenrodyellow"
         }
         ListElement {
             name: "Lightgray"
             colorName: "Lightgray"
         }
         ListElement {
             name: "Lightgreen"
             colorName: "Lightgreen"
         }
         ListElement {
             name: "Lightpink"
             colorName: "Lightpink"
         }
         ListElement {
             name: "Lightsalmon"
             colorName: "Lightsalmon"
         }
         ListElement {
             name: "Lightseagreen"
             colorName: "Lightseagreen"
         }
         ListElement {
             name: "Lightskyblue"
             colorName: "Lightskyblue"
         }
         ListElement {
             name: "Lightslategray"
             colorName: "Lightslategray"
         }
         ListElement {
             name: "Lightsteelblue"
             colorName: "Lightsteelblue"
         }
         ListElement {
             name: "Lightyellow"
             colorName: "Lightyellow"
         }
         ListElement {
             name: "Lime"
             colorName: "Lime"
         }
         ListElement {
             name: "Limegreen"
             colorName: "Limegreen"
         }
         ListElement {
             name: "Linen"
             colorName: "Linen"
         }
         ListElement {
             name: "Magenta"
             colorName: "Magenta"
         }
         ListElement {
             name: "Maroon"
             colorName: "Maroon"
         }
         ListElement {
             name: "Mediumaquamarine"
             colorName: "Mediumaquamarine"
         }
         ListElement {
             name: "Mediumblue"
             colorName: "Mediumblue"
         }
         ListElement {
             name: "Mediumorchid"
             colorName: "Mediumorchid"
         }
         ListElement {
             name: "Mediumpurple"
             colorName: "Mediumpurple"
         }
         ListElement {
             name: "Mediumseagreen"
             colorName: "Mediumseagreen"
         }
         ListElement {
             name: "Mediumslateblue"
             colorName: "Mediumslateblue"
         }
         ListElement {
             name: "Mediumspringgreen"
             colorName: "Mediumspringgreen"
         }
         ListElement {
             name: "Mediumturquoise"
             colorName: "Mediumturquoise"
         }
         ListElement {
             name: "Mediumvioletred"
             colorName: "Mediumvioletred"
         }
         ListElement {
             name: "Midnightblue"
             colorName: "Midnightblue"
         }
         ListElement {
             name: "Mintcream"
             colorName: "Mintcream"
         }
         ListElement {
             name: "Mistyrose"
             colorName: "Mistyrose"
         }
         ListElement {
             name: "Moccasin"
             colorName: "Moccasin"
         }
         ListElement {
             name: "Navajowhite"
             colorName: "Navajowhite"
         }
         ListElement {
             name: "Navy"
             colorName: "Navy"
         }
         ListElement {
             name: "Oldlace"
             colorName: "Oldlace"
         }
         ListElement {
             name: "Olive"
             colorName: "Olive"
         }
         ListElement {
             name: "Olivedrab"
             colorName: "Olivedrab"
         }
         ListElement {
             name: "Orange"
             colorName: "Orange"
         }
         ListElement {
             name: "Orangered"
             colorName: "Orangered"
         }
         ListElement {
             name: "Orchid"
             colorName: "Orchid"
         }
         ListElement {
             name: "Palegoldenrod"
             colorName: "Palegoldenrod"
         }
         ListElement {
             name: "Palegreen"
             colorName: "Palegreen"
         }
         ListElement {
             name: "Paleturquoise"
             colorName: "Paleturquoise"
         }
         ListElement {
             name: "Palevioletred"
             colorName: "Palevioletred"
         }
         ListElement {
             name: "Papayawhip"
             colorName: "Papayawhip"
         }
         ListElement {
             name: "Peachpuff"
             colorName: "Peachpuff"
         }
         ListElement {
             name: "Peru"
             colorName: "Peru"
         }
         ListElement {
             name: "Pink"
             colorName: "Pink"
         }
         ListElement {
             name: "Plum"
             colorName: "Plum"
         }
         ListElement {
             name: "Powderblue"
             colorName: "Powderblue"
         }
         ListElement {
             name: "Purple"
             colorName: "Purple"
         }
         ListElement {
             name: "Red"
             colorName: "Red"
         }
         ListElement {
             name: "Rosybrown"
             colorName: "Rosybrown"
         }
         ListElement {
             name: "Royalblue"
             colorName: "Royalblue"
         }
         ListElement {
             name: "Saddlebrown"
             colorName: "Saddlebrown"
         }
         ListElement {
             name: "Salmon"
             colorName: "Salmon"
         }
         ListElement {
             name: "Sandybrown"
             colorName: "Sandybrown"
         }
         ListElement {
             name: "Seagreen"
             colorName: "Seagreen"
         }
         ListElement {
             name: "Seashell"
             colorName: "Seashell"
         }
         ListElement {
             name: "Sienna"
             colorName: "Sienna"
         }
         ListElement {
             name: "Silver"
             colorName: "Silver"
         }
         ListElement {
             name: "Skyblue"
             colorName: "Skyblue"
         }
         ListElement {
             name: "Slateblue"
             colorName: "Slateblue"
         }
         ListElement {
             name: "Slategray"
             colorName: "Slategray"
         }
         ListElement {
             name: "Snow"
             colorName: "Snow"
         }
         ListElement {
             name: "Springgreen"
             colorName: "Springgreen"
         }
         ListElement {
             name: "Steelblue"
             colorName: "Steelblue"
         }
         ListElement {
             name: "Tan"
             colorName: "Tan"
         }
         ListElement {
             name: "Teal"
             colorName: "Teal"
         }
         ListElement {
             name: "Thistle"
             colorName: "Thistle"
         }
         ListElement {
             name: "Tomato"
             colorName: "Tomato"
         }
         ListElement {
             name: "Turquoise"
             colorName: "Turquoise"
         }
         ListElement {
             name: "Violet"
             colorName: "Violet"
         }
         ListElement {
             name: "Wheat"
             colorName: "Wheat"
         }
         ListElement {
             name: "White"
             colorName: "White"
         }
         ListElement {
             name: "Whitesmoke"
             colorName: "Whitesmoke"
         }
         ListElement {
             name: "Yellow"
             colorName: "Yellow"
         }
         ListElement {
             name: "Yellowgreen"
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
