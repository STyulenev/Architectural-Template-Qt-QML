import QtQuick 2.15

ListModel {
    id: languageListModel

    ListElement {
        text: qsTr("Русский")
        code: "ru_RU"
        // ...
    }

    ListElement {
        text: qsTr("Английский")
        code: "en_US"
    }

    function getIndex(code) {
        for (var i = 0; i < languageListModel.count; ++i) {
            if (languageListModel.get(i).code === code)
                return i;
        }

        return 0;
    }

    // ...
}
