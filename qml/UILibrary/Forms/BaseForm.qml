import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15

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
            topMargin: 50
        }
    }

    Item {
        id: footerArea

        height: root.footerEnabled ? 100 : 0

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}
