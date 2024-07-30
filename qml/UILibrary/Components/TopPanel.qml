import QtQuick 2.11
import Qt.labs.settings 1.0 as QtLabsSettings

import Common 1.0 as Common

import organization.com 1.0 as ViewModels

TopPanel_Form {
    id: topPanel

    property QtObject topPanelViewModel: ViewModels.TopPanelViewModel { }

    QtLabsSettings.Settings {
        id: settings

        category: "Style"

        property int theme: Common.Colors.theme
        // ...
    } // QtLabsSettings.Settings

    Component.onCompleted: {
        Common.Colors.theme = settings.theme;
    }

    // ...
} // TopPanel_Form
