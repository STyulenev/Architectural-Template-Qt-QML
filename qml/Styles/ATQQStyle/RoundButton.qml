import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Controls.Basic 2.11
import QtQuick.Templates 2.11 as Template
import QtQuick.Controls.impl 2.11

import Common 1.0 as Common

Template.RoundButton {
    id: roundButton

    radius: Common.Consts.mainRadiusComponent
    checkable: false

    icon {
        color: roundButton.enabled ? "transparent" : Common.Colors.currentTheme.disabledButtonColor
    }

    font {
        family: Common.Fonts.family
        bold: true
        pixelSize: Common.Fonts.mainPixelSize
    }

    contentItem: IconLabel {
        id: icon

        spacing: roundButton.spacing
        mirrored: roundButton.mirrored
        display: roundButton.display
        icon: roundButton.icon
        text: roundButton.text
        font: roundButton.font
        color: {
            if (roundButton.enabled) {
                return roundButton.pressed ? Common.Colors.permanentСolors.blackColor : Common.Colors.currentTheme.mainThemeColor
            } else {
                return Common.Colors.currentTheme.disabledButtonTextColor;
            }
        }
    } // IconLabel

    background: Rectangle {
        id: background

        anchors.fill: parent

        radius: roundButton.radius
        color: {
            if (roundButton.pressed) {
                return roundButton.enabled ?
                            Common.Colors.currentTheme.mainThemeColor : Common.Colors.currentTheme.disabledButtonColor;
            } else {
                return roundButton.enabled ?
                            Common.Colors.currentTheme.mainBackgroundColor : Common.Colors.currentTheme.disabledButtonColor;
            }
        }

        border {
            color: roundButton.enabled ? Common.Colors.currentTheme.mainThemeColor : Common.Colors.currentTheme.disabledButtonColor
            width: 2 * Common.Consts.radialSize
        }
    } // Rectangle
} // Template.RoundButton
