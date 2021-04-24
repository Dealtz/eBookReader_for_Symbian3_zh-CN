import QtQuick 1.1
import com.nokia.symbian 1.1

Item {
    id: root
    property string title: ""
    property string subTitle: ""

    property string mode: "normal" // Read-only
    property bool platformInverted: false

    signal clicked
    signal pressAndHold

    implicitWidth: screen.width
    implicitHeight: background.height + 2 * platformStyle.paddingLarge

    onModeChanged: {
        if (root.mode == "pressed") {
            pressed.source = privateStyle.imagePath("qtg_fr_choice_list_pressed", root.platformInverted)
            pressed.opacity = 1
        } else {
            releasedEffect.restart()
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: {
            symbian.listInteractionMode = Symbian.TouchInteraction
            internal.state = "Pressed"
        }
        onClicked: {
            internal.state = ""
            root.clicked()
        }
        onReleased: {
            internal.state = ""
        }
        onExited: {
            internal.state = ""
        }
        onCanceled: {
            internal.state = ""
        }
        onPressAndHold: {
            internal.state = "Pressed"
        }
    }

    StateGroup {
        id: internal

        function getMode() {
            if (internal.state == "Pressed" || internal.state == "PressAndHold")
                return "pressed"
            else
                return "normal"
        }

        // Performance optimization:
        // Use value assignment when property changes instead of binding to js function
        onStateChanged: { root.mode = internal.getMode() }
    }

    BorderImage {
        id: background
        height: privateStyle.menuItemHeight - platformStyle.paddingSmall // from layout spec.
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        border {
            left: platformStyle.borderSizeMedium
            top: platformStyle.borderSizeMedium
            right: platformStyle.borderSizeMedium
            bottom: platformStyle.borderSizeMedium
        }
        source: privateStyle.imagePath("qtg_fr_choice_list_" + internal2.getBackground(),
                                       root.platformInverted)

        BorderImage {
            id: pressed
            border {
                left: platformStyle.borderSizeMedium
                top: platformStyle.borderSizeMedium
                right: platformStyle.borderSizeMedium
                bottom: platformStyle.borderSizeMedium
            }
            opacity: 0
            anchors.fill: parent
        }

        Column {
            anchors {
                verticalCenter: background.verticalCenter
                right: indicator.left
                rightMargin: platformStyle.paddingMedium
                left: background.left
                leftMargin: platformStyle.paddingLarge
            }

            Loader {
                anchors.left: parent.left
                sourceComponent: title != "" ? titleText : undefined
                width: parent.width // elide requires explicit width
            }

            Loader {
                anchors.left: parent.left
                sourceComponent: subTitle != "" ? subTitleText : undefined
                width: parent.width // elide requires explicit width
            }
        }
        Image {
            id: indicator
            source: privateStyle.imagePath("qtg_graf_choice_list_indicator", root.platformInverted)
            sourceSize.width: platformStyle.graphicSizeSmall
            sourceSize.height: platformStyle.graphicSizeSmall
            anchors {
                right: background.right
                rightMargin: platformStyle.paddingSmall
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Component {
        id: titleText
        ListItemText {
            mode: root.mode
            role: "Title"
            text: root.title
        }
    }
    Component {
        id: subTitleText
        ListItemText {
            mode: root.mode
            role: "SubTitle"
            text: root.subTitle
        }
    }

    QtObject {
        id: internal2
        function getBackground() {
            if (root.mode == "highlighted")
                return "highlighted"
            else
                return "normal"
        }
    }

    SequentialAnimation {
        id: releasedEffect
        PropertyAnimation {
            target: pressed
            property: "opacity"
            to: 0
            easing.type: Easing.Linear
            duration: 150
        }
    }
}
