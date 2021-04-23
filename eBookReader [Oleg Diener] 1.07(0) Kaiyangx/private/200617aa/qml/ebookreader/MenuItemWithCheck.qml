import QtQuick 1.1
 import com.nokia.symbian 1.1

 MenuItem {
     id: root

     property bool checked: false

     function iconSource() {
         var id
         if (!root.enabled) {
             if (root.checked)
                 id = "disabled_selected"
             else
                 id = "disabled_unselected"
         } else {
             if (root.pressed)
                 id = "pressed"
             else if (root.checked)
                 id = "normal_selected"
             else
                 id = "normal_unselected"
         }
         return privateStyle.imagePath("qtg_graf_checkbox_" + id, root.platformInverted)
     }
     platformLeftMargin: 2 * platformStyle.paddingMedium + platformStyle.graphicSizeSmall
     Image {
         id: checkIcon

         anchors {
             left: parent.left
             leftMargin: platformStyle.paddingMedium
             verticalCenter: parent.verticalCenter
         }

         visible: true
         source: iconSource()
         sourceSize.width: platformStyle.graphicSizeSmall
         sourceSize.height: platformStyle.graphicSizeSmall
     }
 }
