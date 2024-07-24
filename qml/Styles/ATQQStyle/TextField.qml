import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15 as Template

import Common 1.0 as Common

Template.TextField {
    id: textField

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset || Math.max(
                       contentWidth,
                       placeholderText.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        contentHeight + topPadding + bottomPadding,
                        placeholderText.implicitHeight + topPadding + bottomPadding)

    color: Common.Colors.currentTheme.textFieldTextColor
    placeholderTextColor: Common.Colors.currentTheme.hintTextColor
    selectedTextColor: Common.Colors.currentTheme.textFieldTextColor

    font {
        family: Common.Fonts.family
        pixelSize: Common.Fonts.mainPixelSize
        bold: false
    }

    selectionColor: Common.Colors.currentTheme.textFieldSelectionColor
    selectByMouse: true

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignLeft

    leftPadding: 6 //* Common.Consts.xCoord
    rightPadding: 6 //* Common.Consts.xCoord
    topPadding: 0
    bottomPadding: 0

    background: Rectangle {
        color: textField.enabled ? Common.Colors.currentTheme.textFieldBackgroundColor : Common.Colors.currentTheme.textFieldDisabledBackgroundColor
        border.width: 2 //* Common.Consts.radialSize
        border.color: {
            if (textField.enabled) {
                return textField.activeFocus ? Common.Colors.currentTheme.mainThemeColor : Common.Colors.currentTheme.textFieldBackgroundColor;
            } else {
                return Common.Colors.currentTheme.textFieldDisabledBackgroundColor;
            }
        }

        implicitWidth: 120 //* Common.Consts.xCoord
        implicitHeight: 29 //* Common.Consts.yCoord
    }

    cursorDelegate: Rectangle {
        id: cursor

        visible: textField.cursorVisible
        color: Common.Colors.currentTheme.textFieldTealCursorColor
        width: textField.cursorRectangle.width //* Common.Consts.yCoord

        SequentialAnimation {
            PropertyAction {
                target: cursor
                property: "opacity"
                value: 1
            }
            NumberAnimation {
                duration: 500
            }
            PropertyAction {
                target: cursor
                property: "opacity"
                value: 0
            }
            NumberAnimation {
                duration: 500
            }
            running: textField.cursorVisible
            loops: Animation.Infinite
        }
    }

    PlaceholderText {
        id: placeholderText

        x: textField.leftPadding
        y: textField.topPadding
        width: textField.width - (textField.leftPadding + textField.rightPadding)
        height: textField.height - (textField.topPadding + textField.bottomPadding)
        text: textField.placeholderText
        font: textField.font
        color: textField.placeholderTextColor
        verticalAlignment: textField.verticalAlignment
        elide: Text.ElideRight
        renderType: textField.renderType
        visible: !textField.length && !textField.preeditText
                 && (!textField.activeFocus
                     || textField.horizontalAlignment !== Qt.AlignHCenter)
    }
}
