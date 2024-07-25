pragma Singleton

import QtQml 2.15
import QtQuick 2.15

QtObject {
    id: regularExpressions
	
    property QtObject onlyNumbers: RegularExpressionValidator {
        regularExpression: /^\d+$/
    } // RegularExpressionValidator

    property QtObject onlyLetters: RegularExpressionValidator {
        regularExpression: /^[a-zA-Z]+$/
    } // RegularExpressionValidator

    // ...
} // QtObject
