import QtQuick 2.11

import Common 1.0 as Common
import Models 1.0 as Models
import Pages 1.0 as Pages

SettingPage_Form {
    id: formSettingPage

    languageModel: Models.LanguageListModel { }
    languageCurrentIndex: languageModel.getIndex(Common.Values.language);
    themeCurrentIndex: Common.Colors.theme

    onLanguageChanged: (index) => {
        topPanel.topPanelViewModel.language = languageModel.get(index).code;
        themeCurrentIndex = Common.Colors.theme;
    }

    onButtonClicked: {
        back();
    }
} // SettingPage_Form
