import QtQuick 2.15

import Pages 1.0 as Pages

SplashPage_Form {
    id: formSplashPage
    objectName: "SplashPage"

    Component {
        id: componentAuthenticationPage

        Pages.PageLoader {
            page: Pages.AuthenticationPage { }
        } // Pages.PageLoader
    } // Component

    onSplashPageClicked: {
        next(componentAuthenticationPage);
    }

    onUpdate: {
        applicationWindow.headerVisible = false;
    }
} // SplashPage_Form
