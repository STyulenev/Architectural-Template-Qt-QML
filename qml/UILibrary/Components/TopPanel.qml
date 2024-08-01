import QtQuick 2.11
import QtCore as QtCore

import Common 1.0 as Common

import organization.com 1.0 as ViewModels

TopPanel_Form {
    id: topPanel

    property QtObject topPanelViewModel: ViewModels.TopPanelViewModel { }

    QtCore.Settings {
        id: settings

        category: "UserData"

        property int theme: Common.Colors.theme
        property string language: topPanelViewModel.language
        // ...
    } // QtCore.Settings

    Component.onCompleted: {
        if (settings.theme)
            Common.Colors.theme = settings.theme;

        if (settings.language) {
            topPanelViewModel.language = settings.language;
            Common.Values.language = settings.language;
        }
    }

    // ...
} // TopPanel_Form
