import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import Common 1.0 as Common

ApplicationWindow {
    id: applicationWindow

    visible: true

    width: Common.Consts.screenWidth
    height: Common.Consts.screenHeight
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    title: qsTr("Architectural-Template-Qt-QML")

    property bool headerVisible: false

    header: Rectangle {
        id: screenHeader

        height: applicationWindow.headerVisible ? 40 : 0
        visible: applicationWindow.headerVisible

        color: "green"

        Text {
            id: name

            anchors.centerIn: parent
            text: contentFrame.currentItem.pageName ? contentFrame.currentItem.pageName : ""
        }
    }

    StackView {
        id: contentFrame
        objectName: "BaseStackView"

        anchors.fill: parent

        Component.onCompleted: contentFrame.push("qrc:/qml/Pages/Splash/SplashPage.qml")

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
        }
    } // StackView
} // ApplicationWindow
