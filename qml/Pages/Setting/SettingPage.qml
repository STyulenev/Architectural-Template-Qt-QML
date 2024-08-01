import QtQuick 2.11

import Common 1.0 as Common
import Model 1.0 as Model
import Pages 1.0 as Pages

SettingPage_Form {
    id: formSettingPage

    languageModel: Model.LanguageListModel { }

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
