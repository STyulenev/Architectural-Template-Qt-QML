import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Window 2.11

import QtCore as QtCore

import Common 1.0 as Common
import Components 1.0 as Components

import Qt.labs.platform 1.1

ApplicationWindow {
    id: applicationWindow

    visible: true

    width: Common.Consts.screenWidth
    height: Common.Consts.screenHeight
    /*maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width*/

    title: "Architectural-Template-Qt-QML"

    property bool headerVisible: false

    QtObject {
        id: internal

        property bool isTray: true
    } // QtObject

    QtCore.Settings {
        id: applicationWindowSettings

        category: "General"

        property alias x: applicationWindow.x
        property alias y: applicationWindow.y
        property alias width: applicationWindow.width
        property alias height: applicationWindow.height
    } // QtCore.Settings

    SystemTrayIcon {
        id: systemTray

        visible: true

        icon.source: "qrc:/res/icons/icons-tray.png"
        tooltip: "Architectural-Template-Qt-QML"

        onActivated: {
            trayMenu.open();
        }
    } // SystemTrayIcon

    Menu {
        id: trayMenu

        MenuItem {
            text: qsTr("Развернуть окно")

            onTriggered: {
                applicationWindow.show()
            }
        } // MenuItem

        MenuItem {
            text: qsTr("Выход")

            onTriggered: {
                systemTray.hide();
                internal.isTray = false;
                Qt.quit();
            }
        } // MenuItem
    } // Menu

    onClosing: (close) => {
        close.accepted = !internal.isTray;
        applicationWindow.hide();
        systemTray.showMessage("Architectural-Template-Qt-QML", qsTr("Приложение свёрнуто."));
    }

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
