import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Layouts 1.11

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.TwoButtonsForm {
    id: formAuthenticationPage
    pageName: qsTr("Страница аутентификации")

    leftButtonText: qsTr("Назад")
    rightButtonText: qsTr("Вход")

    property alias username: usernameTextField.text
    property alias password: passwordTextField.text

    QtObject {
        id: internal

        readonly property int height: 50 * Common.Consts.yCoord
        readonly property int width:  200 * Common.Consts.xCoord
    } // QtObject

    content: GridLayout {
        id: body

        anchors.centerIn: parent

        rows: 2
        columns: 2

        Label {
            id: usernameLabel

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: internal.width

            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            text: qsTr("Имя:")
        } // Label

        TextField {
            id: usernameTextField

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: 2 * internal.width

            validator: Common.RegExps.onlyLetters
        } // TextField

        Label {
            id: passwordLabel

            Layout.row: 1
            Layout.preferredHeight: internal.height
            Layout.preferredWidth: internal.width
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            text: qsTr("Пароль:")
        } // Label

        TextField {
            id: passwordTextField

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: 2 * internal.width

            validator: Common.RegExps.onlyNumbers
        } // TextField
    } // GridLayout
} // Forms.TwoButtonsForm
