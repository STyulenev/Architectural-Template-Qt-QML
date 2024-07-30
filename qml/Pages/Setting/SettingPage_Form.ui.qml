import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Layouts 1.11

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: formSettingPage
    pageName: qsTr("Настройки")

    QtObject {
        id: internal

        //readonly property int buttonHeight: 80 * Common.Consts.yCoord
       // readonly property int buttonWidth:  400 * Common.Consts.xCoord
    } // QtObject

    content: []
} // Forms.BaseForm
