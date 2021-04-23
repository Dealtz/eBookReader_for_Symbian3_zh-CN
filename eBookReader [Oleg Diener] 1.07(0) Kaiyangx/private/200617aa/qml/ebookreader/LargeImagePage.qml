import QtQuick 1.1
import com.nokia.symbian 1.1
import "options.js" as OPTIONS
import MyLibrary 1.0

Page {
    id: largeImage

    property string type: "imagePage"
    property string photoUrl
    property int photoHeight
    property int photoWidth

    ProgressBar {
        anchors.centerIn: parent
        minimumValue: 1
        maximumValue: 100
        value: image.progress * 100
        visible: image.status != Image.Ready

    //![0]
        Text {
            text: Math.floor(parent.value) + " %"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: 4
            font.bold: true
            color: "white"
            z:5
        }
    }
    //![0]
    Flickable {
        id: flickable

        anchors.fill: parent
        clip: true
        contentWidth: imageContainer.width
        contentHeight: imageContainer.height

        MouseArea {
            anchors.fill: parent
            enabled: !toolbar.visible
            onClicked: {
                timer2.start();
                toolbar.visible = true;
            }
        }
        Item {
            id: imageContainer

            width: Math.max(image.width * image.scale, flickable.width)
            height: Math.max(image.height * image.scale, flickable.height)

            Rectangle{
                id: imageBG
                color: OPTIONS.imageBackgroundColor
                anchors.fill: parent
                Image {
                    id: image

                    property real prevScale
                    fillMode: Image.PreserveAspectCrop
                    anchors.centerIn: parent
                    smooth: !flickable.movingVertically
                    source: largeImage.photoUrl
                    sourceSize.width: (largeImage.photoWidth > 1024
                                       && largeImage.photoWidth > largeImage.photoHeight) ? 1024 : 0
                    sourceSize.height: (largeImage.photoHeight > 1024
                                        && largeImage.photoHeight > largeImage.photoWidth) ? 1024 : 0

                    onStatusChanged: {
                        if (status == Image.Loading) {
                            // Hide and reset slider: move slider handle to the left
                            slider.visible = false;
                            slider.value = 1;
                        } else if (status == Image.Ready && width != 0) {
                            // Default scale shows the entire image.
                            scale = Math.min(flickable.width / width, flickable.height / height);
                            prevScale = Math.min(scale, 1);
                        }
                    }

                    onScaleChanged: {
                        if ((width * scale) > flickable.width) {
                            var xoff = (flickable.width / 2 + flickable.contentX) * scale / prevScale;
                            flickable.contentX = xoff - flickable.width / 2;
                        }
                        if ((height * scale) > flickable.height) {
                            var yoff = (flickable.height / 2 + flickable.contentY) * scale / prevScale;
                            flickable.contentY = yoff - flickable.height / 2;
                        }
                        prevScale = scale;
                    }
                }
            }
        }
    }

    //![2]
    ScrollDecorator {
        flickableItem: flickable
    }
    //![2]

    Text {
        text: "图片打开失败"
        visible: image.status == Image.Error
        anchors.centerIn: parent
        color: "red"
        font.bold: true
    }

    //![1]
    Slider {
        id: slider

        maximumValue: 2
        stepSize: (maximumValue - minimumValue) / 100
        value: 1
        opacity: 1
        anchors {
            bottom: parent.bottom
            bottomMargin: 45
            left: parent.left
            leftMargin: 25
            right: parent.right
            rightMargin: 25
        }
    }

    Menu {
        id: backgroundMenu
        content: MenuLayout {
            MenuItem {
                text: "使用黑色背景"
                onClicked: {
                    imageBG.color = "black";
                    OPTIONS.imageBackgroundColor = "black";
                }
            }
            MenuItem {
                text: "使用白色背景"
                onClicked: {
                    imageBG.color = "white";
                    OPTIONS.imageBackgroundColor = "white";
                }
            }
            MenuItem {
                text: "使用夜间模式"
                onClicked: {
                    imageBG.color = optionsObj.backgroundColor1;
                    OPTIONS.imageBackgroundColor = optionsObj.backgroundColor1
                }
            }
            MenuItem {
                text: "使用白天模式"
                onClicked: {
                    imageBG.color = optionsObj.backgroundColor2;
                    OPTIONS.imageBackgroundColor = optionsObj.backgroundColor2
                }
            }
        }
    }
    tools: ToolBarLayout {
        ToolButton {
            iconSource: "toolbar-back"
            onClicked: pageStack.pop();
        }
        ToolButton {
            iconSource: "qrc:/img/tb_personalise"
            text: "背景"
            onClicked: backgroundMenu.open();
            anchors.right: parent.right
            anchors.rightMargin: 3
        }
    }

    Binding { target: image; property: "scale"; value: slider.value; when: slider.visible }
    //![1]
    Component.onCompleted: orientationLock = PageOrientation.LockPrevious;
}
