import QtQuick 2.15

import Pages 1.0 as Pages

AuthenticationPage_Form {
    id: formAuthenticationPage

    Component {
        id: componentMainMenuPage

        Pages.PageLoader {
            page: Pages.MainMenuPage { }
        } // Pages.PageLoader
    } // Component

    Component.onCompleted: {
        applicationWindow.headerVisible = true;
    }

    onLeftButtonClicked: {
        back();
    }

    onRightButtonClicked: {
        if (true) { // stub
            next(componentMainMenuPage);
        } else {
            // code
        }
    }
} // AuthenticationPage_Form
