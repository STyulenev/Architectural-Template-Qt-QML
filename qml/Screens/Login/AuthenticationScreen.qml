import QtQuick 2.15

AuthenticationScreen_Form {
    id: formAuthenticationScreen
    objectName: "AuthenticationScreen"

    Component.onCompleted: {
        applicationWindow.headerVisible = true;
    }

    onLeftButtonClicked: {
        back();
    }

    onRightButtonClicked: {

    }
} // AuthenticationScreen_Form
