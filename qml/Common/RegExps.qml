pragma Singleton

import QtQml 2.15
import QtQuick 2.15

QtObject {
    id: regularExpressions
	
    property QtObject onlyNumbers: RegularExpressionValidator {
        regularExpression: /^\d+$/
    } // QtObject

    property QtObject onlyLetters: RegularExpressionValidator {
        regularExpression: /^[a-zA-Z]+$/
    } // QtObject

    // ...
} // QtObject
