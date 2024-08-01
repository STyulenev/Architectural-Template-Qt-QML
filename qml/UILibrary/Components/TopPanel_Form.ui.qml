import QtQuick 2.11
import QtQuick.Controls 2.11

import Common 1.0 as Common

Rectangle {
    id: topPanel

    color: Common.Colors.currentTheme.mainThemeColor

    property alias title: title.text

    Label {
        id: title

        anchors.centerIn: parent
    } // Label
} // Rectangle
