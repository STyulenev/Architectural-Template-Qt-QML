import QtQuick 2.15

AuthenticationPage_Form {
    id: formAuthenticationPage
    objectName: "AuthenticationPage"

    Component.onCompleted: {
        applicationWindow.headerVisible = true;
    }

    onLeftButtonClicked: {
        back();
    }

    onRightButtonClicked: {
        // code
    }
} // AuthenticationPage_Form
