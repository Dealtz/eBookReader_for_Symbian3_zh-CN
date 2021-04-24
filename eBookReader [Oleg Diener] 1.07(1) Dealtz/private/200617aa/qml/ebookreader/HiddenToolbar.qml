import QtQuick 1.1
import "." 1.1
import com.nokia.symbian 1.1

Item {
    id: hbar1

    implicitWidth: screen.width
    implicitHeight: privateStyle.statusBarHeight
    property bool platformInverted: false
    signal clicked

    BorderImage {
        id: background
        anchors.fill: parent
        source: privateStyle.imagePath("qtg_fr_toolbar", hbar1.platformInverted)
        border { left: 10; top: 10; right: 10; bottom: 10 }
    }

    Image{
        anchors.centerIn: parent
        source: "qrc:/img/full_screen"
        height: parent.height
        opacity: 0.7
    }
    MouseArea{
        anchors.fill: parent
        onPressed: {
            hbar1.clicked();
        }
    }
}
