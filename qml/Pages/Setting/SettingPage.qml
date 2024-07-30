import QtQuick 2.11

import Pages 1.0 as Pages

SettingPage_Form {
    id: formSettingPage

    onLanguageChanged: (index) => {
        if (index === 0) {
            topPanel.topPanelViewModel.language = "ru_RU";
            return;
        }
        if (index === 1) {
            topPanel.topPanelViewModel.language = "en_US";
            return;
        }
    }

    onButtonClicked: {
        back();
    }
} // SettingPage_Form
