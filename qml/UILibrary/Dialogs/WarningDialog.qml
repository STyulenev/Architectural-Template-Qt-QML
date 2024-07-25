import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

import Common 1.0 as Common

AbstractDialog {
    id: warningDialog

    property alias title: label.text

    content: ColumnLayout {
        id: body

        anchors {
            fill: parent
            margins: 20 * Common.Consts.radialSize
        }

        spacing: 20 * Common.Consts.yCoord

        Label {
            id: label

            Layout.fillWidth: true
            Layout.fillHeight: true

            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter

            wrapMode: Text.WordWrap
        } // Label

        RowLayout {
            id: buttonLayout

            Layout.fillWidth: true
            Layout.preferredHeight: 50 * Common.Consts.yCoord
            Layout.maximumHeight: 50 * Common.Consts.yCoord
            Layout.alignment: Qt.AlignBottom

            spacing: 10 * Common.Consts.xCoord

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            } // Item

            RoundButton {
                id: closeButton

                Layout.fillHeight: true
                Layout.fillWidth: true

                text: qsTr("Ок")

                onClicked: {
                    warningDialog.closeDialog();
                }
            } // RoundButton
        } // RowLayout
    } // ColumnLayout
} // AbstractDialog
