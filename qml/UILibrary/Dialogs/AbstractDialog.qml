import QtQuick 2.11
import QtQuick.Window 2.11 as QtQuickWindow

import Common 1.0 as Common

Window {
    id: root

    signal closeDialog()
    // ...

    flags: Qt.Popup
    modality: Qt.WindowModal

    width: 500 * Common.Consts.xCoord
    height: 250 * Common.Consts.yCoord

    x: QtQuickWindow.Screen.width / 2 - root.width / 2
    y: QtQuickWindow.Screen.height / 2 - root.height / 2

    property alias content: bodyItem.children

    Rectangle {
        id: bodyItem

        anchors.fill: parent

        color: Common.Colors.currentTheme.mainBackgroundColor

        border {
            color: Common.Colors.currentTheme.mainThemeColor
            width: Common.Consts.mainRadiusComponent
        }
    } // Rectangle
} // Window
