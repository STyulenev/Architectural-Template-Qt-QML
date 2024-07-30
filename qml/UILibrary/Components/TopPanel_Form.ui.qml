import QtQuick 2.11
import QtQuick.Controls 2.11

import Common 1.0 as Common

Rectangle {
    id: topPanel

    color: "green"

    property alias title: title.text

    Label {
        id: title

        anchors.centerIn: parent
    } // Label
} // Rectangle
