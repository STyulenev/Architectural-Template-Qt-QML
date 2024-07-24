import QtQml 2.11
import QtQuick 2.11
import QtQuick.Controls 2.11

import Common 1.0 as Common

Item {
    id: root

    required property string pageName

    signal back()
    signal next(Component page)
    // дополнительные сигналы для логики перехода между страницыми

    signal update()

    property bool footerEnabled: false
	
    property alias content: bodyItem.children
    property alias footer: footerArea.children

    Item {
        id: bodyItem

        anchors {
            fill: parent
            topMargin: 50 * Common.Consts.yCoord
        }
    } // Item

    Item {
        id: footerArea

        height: root.footerEnabled ? 100 * Common.Consts.yCoord : 0

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    } // Item
} // Item
