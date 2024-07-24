import QtQuick 2.11

import Pages 1.0 as Pages

SplashPage_Form {
    id: formSplashPage

    Component {
        id: componentAuthenticationPage

        Pages.PageLoader {
            page: Pages.AuthenticationPage {
                // ...
            } // Pages.AuthenticationPage
        } // Pages.PageLoader
    } // Component

    onSplashPageClicked: {
        next(componentAuthenticationPage);
    }

    onUpdate: {
        applicationWindow.headerVisible = false;
    }
} // SplashPage_Form
