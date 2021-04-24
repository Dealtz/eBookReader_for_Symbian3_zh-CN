import QtQuick 1.1
import com.nokia.symbian 1.1

Text {
    property bool platformInverted: false
    color: platformInverted ? platformStyle.colorNormalLightInverted
                            : platformStyle.colorNormalLight
//    font.family: "Georgia"
}
