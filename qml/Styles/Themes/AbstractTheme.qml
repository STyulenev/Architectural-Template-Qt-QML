import QtQuick 2.11

QtObject {
    id: abstractTheme

    property color mainBackgroundColor
    property color mainThemeColor

    // Label/TextArea color properties
    property color textColor
    property color hintTextColor

    // Button color properties
    property color mainButtonTextColor
    property color disabledButtonTextColor
    property color disabledButtonColor

    // TextField color properties
    property color textFieldTextColor
    property color textFieldBackgroundColor
    property color textFieldCursorColor
    property color textFieldTealCursorColor
    property color textFieldSelectionColor
    property color textFieldDisabledColor
    property color textFieldDisabledBackgroundColor
    property color textFieldFocusedColor

    // другие цвета ...
} // QtObject
