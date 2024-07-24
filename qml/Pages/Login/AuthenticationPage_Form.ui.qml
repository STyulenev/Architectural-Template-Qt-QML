import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.TwoButtonsForm {
    id: formAuthenticationPage
    pageName: qsTr("Страница аутентификации")

    leftButtonText: qsTr("Назад")
    rightButtonText: qsTr("Вход")

    property alias username: usernameTextField.text
    property alias password: passwordTextField.text

    content: GridLayout {
        id: body

        anchors.centerIn: parent

        rows: 2
        columns: 2

        Label {
            id: usernameLabel

            Layout.preferredHeight: 50
            Layout.preferredWidth: 100

            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            text: qsTr("Имя:")
        } // Label

        TextField {
            id: usernameTextField

            Layout.preferredHeight: 50
            Layout.preferredWidth: 200

            validator: Common.RegExps.onlyLetters
        } // TextField

        Label {
            id: passwordLabel

            Layout.row: 1
            Layout.preferredHeight: 50
            Layout.preferredWidth: 100
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            text: qsTr("Пароль:")
        } // Label

        TextField {
            id: passwordTextField

            Layout.preferredHeight: 50
            Layout.preferredWidth: 200

            validator: Common.RegExps.onlyNumbers
        } // TextField
    } // GridLayout
} // Forms.TwoButtonsForm
