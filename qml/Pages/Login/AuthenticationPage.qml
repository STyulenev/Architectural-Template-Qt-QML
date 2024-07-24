import QtQuick 2.15

import Dialogs 1.0 as Dialogs
import Logic 1.0 as Logic
import Pages 1.0 as Pages

AuthenticationPage_Form {
    id: formAuthenticationPage

    Component {
        id: dialogInputError

        Dialogs.DialogLoader {
            dialog: Dialogs.WarningDialog {
                title: qsTr("Ошибка в имени пользователя и/или пароле.")
            } // Dialogs.WarningDialog
        } // Dialogs.DialogLoader
    } // Component

    Component {
        id: componentMainMenuPage

        Pages.PageLoader {
            page: Pages.MainMenuPage {
                // ...
            } // Pages.MainMenuPage
        } // Pages.PageLoader
    } // Component

    Component.onCompleted: {
        applicationWindow.headerVisible = true;
    }

    onLeftButtonClicked: {
        back();
    }

    onRightButtonClicked: {
        if (Logic.Functions.checkString(username) && Logic.Functions.checkString(password)) {
            if (true) { // stub
                next(componentMainMenuPage);
            } else {
                dialogInputError.createObject(formAuthenticationPage);
            }
        } else {
            dialogInputError.createObject(formAuthenticationPage);
        }
    }
} // AuthenticationPage_Form
