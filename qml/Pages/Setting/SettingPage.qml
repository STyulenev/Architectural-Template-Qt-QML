import QtQuick 2.11

import Common 1.0 as Common
import Models 1.0 as Models
import Pages 1.0 as Pages

SettingPage_Form {
    id: formSettingPage

    languageModel: Models.LanguageListModel { }

    Component.onCompleted: {
        languageCurrentIndex = languageModel.getIndex(Common.Values.language);
    }

    onLanguageChanged: (index) => {
        topPanel.topPanelViewModel.language = languageModel.get(index).code;
    }

    onButtonClicked: {
        back();
    }
} // SettingPage_Form
