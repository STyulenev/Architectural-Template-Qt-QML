pragma Singleton

import QtQuick 2.11

import Themes 1.0 as Themes

QtObject {
    id: colors

    // Флаг смена темы
    property int theme: Enums.Themes.RED

    // Список существующих тем
    readonly property var blueTheme:   Themes.BlueTheme { }
    readonly property var purpleTheme: Themes.PurpleTheme { }
    readonly property var redTheme:    Themes.RedTheme { }

    // Текущая тема
    readonly property Themes.AbstractTheme currentTheme: {
        switch (colors.theme) {
            case Enums.Themes.BLUE:
                return colors.blueTheme;
            case Enums.Themes.PURPLE:
                return colors.purpleTheme;
            case Enums.Themes.RED:
                return colors.redTheme;
            default:
                // ошибка
        }
    }

    function changeTheme(value) {
        switch (value) {
            case 0:
                colors.theme = Enums.Themes.BLUE;
                break;
            case 1:
                colors.theme = Enums.Themes.PURPLE;
                break;
            case 2:
                colors.theme = Enums.Themes.RED;
                break;
            default:
                // ошибка
        }
    }

    // Постоянные цвета, для любой темы
    readonly property QtObject permanentСolors: QtObject {
        readonly property color blackColor: "#000000"

        // ...
    } // QtObject
} // QtObject
