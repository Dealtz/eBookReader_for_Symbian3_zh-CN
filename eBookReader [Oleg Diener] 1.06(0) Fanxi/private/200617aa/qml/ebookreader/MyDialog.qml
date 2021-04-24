import QtQuick 1.1
import com.nokia.symbian 1.1

Dialog {
    id: root

    property alias titleText: titleAreaText.text
    property url titleIcon
    property bool privateCloseIcon: false
    property bool closeAllowed: true

    buttons: []
    signal closeButtonClicked();

    QtObject {
        id: internal

        function iconSource() {
            if (privateCloseIcon) {
                return privateStyle.imagePath((iconMouseArea.pressed && !iconMouseArea.pressCancelled
                    ? "qtg_graf_popup_close_pressed"
                    : "qtg_graf_popup_close_normal"),
                    root.platformInverted)
            } else {
                return root.titleIcon
            }
        }
    }

    title: Item {
        anchors.left: parent.left
        anchors.right: parent.right
        height: platformStyle.graphicSizeSmall + 2 * platformStyle.paddingLarge

        LayoutMirroring.enabled: privateCloseIcon ? false : undefined
        LayoutMirroring.childrenInherit: true

        Item {
            id: titleLayoutHelper // needed to make the text mirror correctly

            anchors.left: parent.left
            anchors.right: titleAreaIcon.source == "" ? parent.right : titleAreaIcon.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: platformStyle.paddingLarge

            Text {
                id: titleAreaText

                LayoutMirroring.enabled: root.LayoutMirroring.enabled

                anchors.fill: parent
                font { family: platformStyle.fontFamilyRegular; pixelSize: platformStyle.fontSizeLarge }
                color: root.platformInverted ? platformStyle.colorNormalLinkInverted
                                             : platformStyle.colorNormalLink
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }

        Image {
            id: titleAreaIcon

            anchors.right: parent.right
            anchors.rightMargin: platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter
            source: internal.iconSource()
            sourceSize.height: platformStyle.graphicSizeSmall
            sourceSize.width: platformStyle.graphicSizeSmall

            MouseArea {
                id: iconMouseArea

                property bool pressCancelled

                anchors.centerIn: parent
                width: parent.width + 2 * platformStyle.paddingLarge
                height: parent.height + 2 * platformStyle.paddingLarge
                enabled: privateCloseIcon && root.status === DialogStatus.Open

                onPressed: {
                    pressCancelled = false
                    privateStyle.play(Symbian.BasicButton)
                }
                onClicked: {
                    if (!pressCancelled)
                    {
                        root.closeButtonClicked();
                        if(root.closeAllowed)
                            root.reject()
                    }
                }
                onReleased: {
                    if (!pressCancelled)
                        privateStyle.play(Symbian.PopupClose)
                }
                onExited: {
                    pressCancelled = true
                }
            }
        }
    }
}
