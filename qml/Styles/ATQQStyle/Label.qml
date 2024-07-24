import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Templates 2.11 as Template

import Common 1.0 as Common

Template.Label {
    id: label

    color: Common.Colors.currentTheme.textColor

    font {
        family: Common.Fonts.family
        bold: true
        pixelSize: Common.Fonts.mainPixelSize
    }

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
} // Template.Label
