pragma Singleton

import QtQuick 2.15

QtObject {
    id: fonts

    property FontLoader helvetica: FontLoader {
        id: helvetica

        source: "qrc:/res/fonts/Helvetica.ttf"
    } // FontLoader

    readonly property alias family: helvetica.name

    // Основные размеры шрифтов
    readonly property int mainPixelSize: 22 //* Consts.fontSize

    // ...
} // QtObject
