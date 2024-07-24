import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Layouts 1.11

import Forms 1.0 as Forms

Forms.BaseForm {
    id: formSplashPage
    pageName: ""

    signal splashPageClicked()

    content: Label {
        id: greetingLabel

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
                    formSplashPage.splashPageClicked();
                }
            } // Connections
        } // MouseArea
    } // Label
} // Forms.BaseForm
