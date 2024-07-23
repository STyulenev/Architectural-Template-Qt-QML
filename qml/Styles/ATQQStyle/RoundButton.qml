import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Templates 2.4 as Template
import QtQuick.Controls.impl 2.4

import Common 1.0 as Common

Template.RoundButton {
    id: roundButton

    radius: Common.Consts.mainRadiusComponent
    checkable: false

    // QTBUG-85685
    Component.onCompleted: {
        palette.button = roundButton.enabled ?
                    Common.Colors.currentTheme.mainBackgroundColor : Common.Colors.currentTheme.disabledButtonColor;

        palette.highlight = roundButton.enabled ?
                    Common.Colors.currentTheme.mainThemeColor : Common.Colors.currentTheme.disabledButtonColor;
    }

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
        color: roundButton.pressed ? roundButton.palette.highlight : roundButton.palette.button

        border {
            color: roundButton.enabled ? Common.Colors.currentTheme.mainThemeColor : Common.Colors.currentTheme.disabledButtonColor
            width: 2
        }
    } // Rectangle
} // Template.RoundButton
