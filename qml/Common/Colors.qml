pragma Singleton

import QtQuick 2.11

import Common 1.0 as Common
import Themes 1.0 as Themes

QtObject {
    id: colors

    // Временный флаг смена темы
    property int theme: Common.Enums.Themes.LIGHT

    // Список существующих тем
    readonly property var darkTheme:  Themes.DarkTheme { }
    readonly property var lightTheme: Themes.LightTheme { }

    // Текущая тема
    readonly property Themes.AbstractTheme currentTheme: {
        switch (colors.theme) {
            case Common.Enums.Themes.LIGHT:
                return colors.lightTheme;
            case Common.Enums.Themes.DARK:
                return colors.darkTheme;
            default:
                // error
        }
    }

    // Постоянные цвета, для любой темы
    readonly property QtObject permanentСolors: QtObject {
        // ...
    }
}
