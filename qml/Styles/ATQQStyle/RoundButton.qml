import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Templates 2.4 as Template
import QtQuick.Controls.impl 2.4

import Common 1.0 as Common

Template.RoundButton {
    id: roundButton

    radius: Common.Consts.mainRadiusComponent
    checkable: false
    focusPolicy: Qt.NoFocus

    // QTBUG-85685
    Component.onCompleted: {
        if (roundButton.focusPolicy === Qt.TabFocus)
            palette.button = roundButton.enabled ? Common.Colors.permanentСolors.yellowButtonColor : Common.Colors.currentTheme.disabledButtonColor;
        else
            palette.button = roundButton.enabled ? Common.Colors.currentTheme.enabledButtonColor : Common.Colors.currentTheme.disabledButtonColor;

        if (roundButton.focusPolicy === Qt.TabFocus)
            palette.highlight = roundButton.enabled ? Common.Colors.currentTheme.enabledButtonColor : Common.Colors.currentTheme.disabledButtonColor;
        else
            palette.highlight = roundButton.enabled ? Common.Colors.permanentСolors.yellowButtonColor : Common.Colors.currentTheme.disabledButtonColor;
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
                if (roundButton.focusPolicy === Qt.TabFocus)  {
                    return roundButton.pressed ? Common.Colors.currentTheme.mainButtonTextColor : Common.Colors.permanentСolors.textBlackColor;
                } else {
                    return roundButton.pressed ? Common.Colors.permanentСolors.textBlackColor : Common.Colors.currentTheme.mainButtonTextColor;
                }
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
    } // Rectangle
} // Template.RoundButton
