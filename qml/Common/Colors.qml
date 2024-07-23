pragma Singleton

import QtQuick 2.11

import Common 1.0 as Common
import Themes 1.0 as Themes

QtObject {
    id: colors

    // Временный флаг смена темы
    property int theme: Common.Enums.Themes.RED

    // Список существующих тем
    readonly property var blueTheme:   Themes.BlueTheme { }
    readonly property var purpleTheme: Themes.PurpleTheme { }
    readonly property var redTheme:    Themes.RedTheme { }

    // Текущая тема
    readonly property Themes.AbstractTheme currentTheme: {
        switch (colors.theme) {
            case Common.Enums.Themes.BLUE:
                return colors.blueTheme;
            case Common.Enums.Themes.PURPLE:
                return colors.purpleTheme;
            case Common.Enums.Themes.RED:
                return colors.redTheme;
            default:
                // error
        }
    }

    // Постоянные цвета, для любой темы
    readonly property QtObject permanentСolors: QtObject {
        readonly property color blackColor: "#000000"

        // ...
    }
}
