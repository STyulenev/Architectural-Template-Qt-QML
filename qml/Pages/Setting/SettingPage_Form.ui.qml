import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Layouts 1.11

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.OneButtonForm {
    id: formSettingPage
    pageName: qsTr("Настройки")

    buttonText: qsTr("Назад")
    layoutDirection: Qt.RightToLeft

    signal languageChanged(index: int)

    property alias languageCurrentIndex: languageComboBox.currentIndex
    property alias languageModel: languageComboBox.model

    QtObject {
        id: internal

        readonly property int height: 50 * Common.Consts.yCoord
        readonly property int width:  150 * Common.Consts.xCoord
    } // QtObject

    content: GridLayout {
        id: body

        anchors.centerIn: parent

        rows: 2
        columns: 2

        Label {
            id: themeLabel

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: internal.width

            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            text: qsTr("Тема:")
        } // Label

        ComboBox {
            id: themeComboBox

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: 2 * internal.width

            model: [ qsTr("Синяя"), qsTr("Фиолетовая"), qsTr("Красная") ]

            currentIndex: Common.Colors.theme

            Connections {
                target: themeComboBox

                function onCurrentIndexChanged() {
                    Common.Colors.changeTheme(themeComboBox.currentIndex);
                }
            } // Connections
        } // ComboBox

        Label {
            id: languageLabel

            Layout.row: 1
            Layout.preferredHeight: internal.height
            Layout.preferredWidth: internal.width
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            text: qsTr("Язык:")
        } // Label

        ComboBox {
            id: languageComboBox

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: 2 * internal.width

            textRole: "text"

            Connections {
                target: languageComboBox

                function onActivated(index) {
                    formSettingPage.languageChanged(index);
                }
            } // Connections
        } // ComboBox
    } // GridLayout
} // Forms.BaseForm
