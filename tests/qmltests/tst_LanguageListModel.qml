import QtQuick 2.15
import QtTest 1.1

import "../../qml/Models" 1.0 as Models

TestCase {
    id: root
    name: "Test_LanguageListModel"

    property QtObject testLanguageListModel: Models.LanguageListModel { }

    function init() {

    }

    function test_Model() {
        compare(testLanguageListModel.count, 2);
    }

    function test_getIndex() {
        compare(testLanguageListModel.getIndex("ru_RU"), 0);
        compare(testLanguageListModel.getIndex("en_US"), 1);
    }

    // ...
} // TestCase
