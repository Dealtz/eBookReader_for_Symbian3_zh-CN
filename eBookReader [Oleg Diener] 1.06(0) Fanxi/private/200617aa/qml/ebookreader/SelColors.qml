import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: internal
    property string fontColor: "Black"
    property string backgroundColor: "White"
    property int brightness: 100;
    property int brightness2: 100;
    property int _type: 0    

    signal clickedOk

    property Slider sliderInternal: null


    function setBrightness(n)
    {
        if(sliderInternal !== null)
            sliderInternal.value = n;
        brightness = n;
        brightness2 = n;
    }

    function colorSelected()
    {
        switch(selColorPage._type)
        {
        case 1: fontColor = selColorPage._color;
            break;
        case 2: backgroundColor = selColorPage._color;
            break;
        default: return;
        }
    }

    function itemClicked(t)
    {
        if(t === 3) return;
        selColorPage._type = t;
        selColorPage.selected.connect(colorSelected);
        pageStack.push(selColorPage);
    }

    function doOk()
    {
        clickedOk();
        pageStack.pop();
    }    

    onStatusChanged: {
        if(status === PageStatus.Active){
            listView.focus = true;
            listView.currentIndex = 0
        }
    }
    onFocusChanged: {
        if(focus) listView.focus = true;
    }
    ListModel
    {
        id: listModel
        ListElement{
            _typ: 1
        }
        ListElement{
            _typ: 2
        }
        ListElement{
            _typ: 3
        }
    }
    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        delegate: listDelegate
        model: listModel
    }
    ScrollDecorator {
        flickableItem: listView
    }

    Component{
        id: listDelegate
        ListItem {
            subItemIndicator: _typ === 3 ? false : true
            height: _typ === 3 ? (implicitHeight + slider.implicitHeight) : undefined
            onClicked: itemClicked(_typ)
            onFocusChanged: {
                if(activeFocus && (_typ === 3)) slider.focus = true;
            }

            Row {
                anchors.fill: parent.paddingItem
                visible: _typ === 1
                Rectangle{
                    width: 40
                    height: 40
                    color: fontColor
                    border.width: 1
                    radius: 5
                    border.color: "Lime"
                }
                ListItemText {
                    mode: "normal"
                    role: "Title"
                    text: "  " + qsTr("字体颜色")
                }
            }
            Row {
                anchors.fill: parent.paddingItem
                visible: _typ === 2
                Rectangle{
                    width: 40
                    height: 40
                    color: backgroundColor
                    border.width: 1
                    radius: 5
                    border.color: "Lime"
                }
                ListItemText {
                    mode: "normal"
                    role: "Title"
                    text: "  " + qsTr("背景颜色")
                }
            }
            Column{
                spacing: 5
                id: brightnessItem
                anchors.fill: parent.paddingItem
                visible: _typ === 3
                ListItemText {
                    id: brightnessTitle
                    role: "Title"
                    text: qsTr("亮度")
                }
                Rectangle{
                    id: brightnessSample
                    color: Qt.lighter(backgroundColor, brightness / 100);
                    height: 35
                    width: parent.width
                    radius: 5
                    anchors.horizontalCenter: parent.horizontalCenter                    
                    Text{
                        anchors.centerIn: parent
                        text: qsTr("示例文本")
                        color: Qt.lighter(fontColor, brightness / 100);
                    }
                }
                Slider {
                    id: slider
                    minimumValue: 30
                    maximumValue: 100
                    stepSize: 1
                    value: brightness2
                    opacity: 1
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    onValueChanged: {
                        sliderInternal = slider;
                        brightness = slider.value;
                    }
                }

//                Binding { target: internal; property: "brightness"; value: slider.value; when: _typ === 3 }
//                Binding { target: slider; property: "value"; value: internal.brightness2; when: _typ === 3 }
            }
        }
    }
    tools:
        ToolBarLayout {
        backButton: true
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: doOk()
            flat: false
        }
    }    
}
