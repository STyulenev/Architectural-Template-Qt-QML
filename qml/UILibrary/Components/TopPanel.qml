import QtQuick 2.11

import organization.com 1.0 as ViewModels

TopPanel_Form {
    id: topPanel

    property QtObject topPanelViewModel: ViewModels.TopPanelViewModel { }

    // ...
} // TopPanel_Form
