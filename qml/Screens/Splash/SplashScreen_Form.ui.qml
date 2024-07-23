import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Forms 1.0 as Forms

Forms.BaseForm {
    id: formSplashScreen
    screenName: "SplashScreen"

    signal splashScreenClicked()

    content: Label {
        id: buttonRow

        anchors.fill: parent

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        text: qsTr("Приветствие...")

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            Connections {
                target: mouseArea

                function onClicked() {
                    formSplashScreen.splashScreenClicked();
                }
            }
        }
    }
}
