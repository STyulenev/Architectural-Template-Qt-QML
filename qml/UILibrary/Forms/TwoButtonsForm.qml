import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

//import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: twoButtonsForm

    signal leftButtonClicked()
    signal rightButtonClicked()

    property alias leftButtonText: leftButton.text
    property alias rightButtonText: rightButton.text

    footerEnabled: true

    footer: RowLayout {
        id: layout

        anchors {
            fill: parent
            margins: 10
        }

        spacing: 10

        RoundButton {
            id: leftButton

            Layout.fillHeight: true
            Layout.fillWidth: true

            text: "Left Button"

            onClicked: {
                twoButtonsForm.leftButtonClicked();
            }
        }

        RoundButton {
            id: rightButton

            Layout.fillHeight: true
            Layout.fillWidth: true

            focusPolicy: Qt.TabFocus

            text: "Right Button"

            onClicked: {
                twoButtonsForm.rightButtonClicked();
            }
        }
    }
}
