import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Window 2.11

import Qt.labs.settings 1.0 as QtLabsSettings

import Common 1.0 as Common
import Components 1.0 as Components

ApplicationWindow {
    id: applicationWindow

    visible: true

    width: Common.Consts.screenWidth
    height: Common.Consts.screenHeight
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    title: "Architectural-Template-Qt-QML"

    property bool headerVisible: false

    QtLabsSettings.Settings {
        id: applicationWindowSettings

        category: "General"

        property alias x: applicationWindow.x
        property alias y: applicationWindow.y
        property alias width: applicationWindow.width
        property alias height: applicationWindow.height
    } // QtLabsSettings.Settings

    header: Components.TopPanel {
        id: topPanel

        height: applicationWindow.headerVisible ? 50 * Common.Consts.yCoord : 0
        visible: applicationWindow.headerVisible

        title: contentFrame.currentItem.pageName ? contentFrame.currentItem.pageName : ""
    } // Components.TopPanel

    StackView {
        id: contentFrame

        anchors.fill: parent

        Component.onCompleted: {
            contentFrame.push("qrc:/qml/Pages/Splash/SplashPage.qml");
        }

        pushEnter: null
        pushExit: null
        popEnter: null
        popExit: null
        replaceEnter: null
        replaceExit: null

        onCurrentItemChanged: {
            contentFrame.currentItem.forceActiveFocus();
            contentFrame.currentItem.update();
        }

        Connections {
            target: contentFrame.currentItem

            function onBack() {
                contentFrame.pop();
            }

            function onNext(page) {
                contentFrame.push(page);
            }

            // дополнительные функции перехода между страницами
        } // Connections
    } // StackView
} // ApplicationWindow
