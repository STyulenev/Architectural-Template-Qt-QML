import QtQuick 2.6
import QtQuick.Controls 2.6
import QtQuick.Templates 2.6 as Template

import Common 1.0 as Common

Template.ComboBox {
    id: comboBox

    implicitWidth: implicitBackgroundWidth
    implicitHeight: implicitBackgroundHeight
    font.pixelSize: Common.Fonts.mainPixelSize

    delegate: MenuItem {
        id: menuItem

        width: ListView.view ? ListView.view.width : 0
        text: comboBox.textRole ? (Array.isArray(comboBox.model) ? modelData[comboBox.textRole] : model[comboBox.textRole]) : modelData
        highlighted: comboBox.highlightedIndex === index
        hoverEnabled: comboBox.hoverEnabled

        Canvas {
            id: dot

            x: menuItem.width - width + 2 * Common.Consts.xCoord
            y: menuItem.topPadding + (menuItem.availableHeight - height) / 2
            width: menuItem.height
            height: menuItem.height
            visible: menuItem.hovered

            onPaint: {
                var context = getContext("2d");
                context.reset();
                context.arc(height / 2, height / 2, 7, 0 * Math.PI, 2 * Math.PI);
                context.fillStyle = Common.Colors.mainThemeColor;
                context.fill();
            }
        } // Canvas
    } // MenuItem

    indicator: Canvas {
        id: canvas

        x: comboBox.width - width - 5 * Common.Consts.xCoord
        y: comboBox.topPadding + (comboBox.availableHeight - height) / 2
        width: comboBox.height *  0.6
        height: comboBox.height * 0.5
        rotation: popup.opened ? 90 : 0

        Connections {
            target: comboBox

            function onPressedChanged() {
                canvas.requestPaint();
            }
        } // Connections

        onPaint: {
            var context = getContext("2d");

            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = Common.Colors.mainThemeColor;
            context.fill();
        }
    } // Canvas

    contentItem: Template.TextField {
        id: inputField

        leftPadding: 6 * Common.Consts.xCoord
        rightPadding: 6 * Common.Consts.xCoord - comboBox.padding
        topPadding: 0
        bottomPadding: 0
        
        font {
            family: Common.Fonts.family
            pixelSize: Common.Fonts.mainPixelSize
            bold: false
        }

        text: comboBox.displayText
        enabled: comboBox.editable
        autoScroll: comboBox.editable
        readOnly: comboBox.down
        inputMethodHints: comboBox.inputMethodHints
        validator: comboBox.validator
        color: Common.Colors.currentTheme.mainBackgroundColor
        selectionColor: comboBox.palette.highlight
        selectedTextColor: comboBox.palette.highlightedText
        verticalAlignment: Text.AlignVCenter
    } // Template.TextField

    background: Rectangle {
        implicitWidth: 85 * Common.Consts.xCoord
        implicitHeight: 29 * Common.Consts.yCoord
        radius: Common.Consts.mainRadiusComponent
        visible: !comboBox.flat || comboBox.down

        border {
            color: Common.Colors.currentTheme.mainThemeColor
            width: 2 * Common.Consts.radialSize
        }
    } // Rectangle

    popup: Template.Popup {
        id: popup

        y: comboBox.height - 1
        implicitHeight: contentItem.implicitHeight
        width: comboBox.width
        height: comboBox.model.length < 4 ? inputField.height * comboBox.model.length : inputField.height * 4

        palette: comboBox.palette
        font: comboBox.font
        topPadding: 4 * Common.Consts.yCoord
        leftPadding: 2 * Common.Consts.xCoord
        rightPadding: 2 * Common.Consts.xCoord
        bottomPadding: 4 * Common.Consts.yCoord

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: comboBox.delegateModel
            currentIndex: comboBox.highlightedIndex
            highlightRangeMode: ListView.ApplyRange
            Template.ScrollBar.vertical: ScrollBar { }
        } // ListView

        background: Rectangle {
            color: comboBox.popup.palette.window
            border.color: Common.Colors.currentTheme.mainThemeColor
            border.width: 2 * Common.Consts.radialSize
            radius: 3 * Common.Consts.radialSize
        } // Rectangle
    } // Template.Popup
} // Template.ComboBox
