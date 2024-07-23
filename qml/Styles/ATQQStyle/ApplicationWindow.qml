import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Templates 2.4 as Template

import Common 1.0 as Common

Template.ApplicationWindow {
    id: applicationWindow

    menuBar: Item {
        visible: false
    } // Item

    color: Common.Colors.currentTheme.mainBackgroundColor
} // Template.ApplicationWindow
