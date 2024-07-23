import QtQuick 2.15

import Screens 1.0 as Screens

SplashScreen_Form {
    id: formSplashScreen
    objectName: "SplashScreen"

    Component {
        id: componentAuthenticationScreen

        Screens.ScreenLoader {
            screen: Screens.AuthenticationScreen { }
        } // Screens.ScreenLoader
    } // Component

    onSplashScreenClicked: {
        next(componentAuthenticationScreen);
    }

    onUpdate: {
        applicationWindow.headerVisible = false;
    }
} // SplashScreen_Form
