import QtQuick 2.11

import Pages 1.0 as Pages

MainMenuPage_Form {
    id: formMainMenuPage

    Component {
        id: componenSettingPage

        Pages.PageLoader {
            page: Pages.SettingPage {
                // ...
            } // Pages.SettingPage
        } // Pages.PageLoader
    } // Component

    onExitButtonClicked: {
        Qt.callLater(Qt.quit);
    }

    onSettingButtonClicked: {
        next(componenSettingPage);
    }
} // MainMenuPage_Form
