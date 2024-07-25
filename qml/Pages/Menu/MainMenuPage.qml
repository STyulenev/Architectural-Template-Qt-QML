import QtQuick 2.11

import Pages 1.0 as Pages

MainMenuPage_Form {
    id: formMainMenuPage

    onExitButtonClicked: {
        Qt.callLater(Qt.quit);
    }

    onSettingButtonClicked: {
        // code
    }
} // MainMenuPage_Form
