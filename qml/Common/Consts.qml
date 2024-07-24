pragma Singleton

import QtQuick 2.11
import QtQuick.Window 2.11 as QtQuickWindow

QtObject {
    id: consts

    readonly property int mockupScreenWidth: 800
    readonly property int mockupScreenHeight: 600

    readonly property int screenWidth: 800 // QtQuickWindow.Screen.width
    readonly property int screenHeight: 600 // QtQuickWindow.Screen.height

    readonly property real xCoord: consts.screenWidth / consts.mockupScreenWidth
    readonly property real yCoord: consts.screenHeight / consts.mockupScreenHeight
    readonly property real radialSize: Math.min(consts.xCoord, consts.yCoord)
    readonly property real fontSize: Math.min(consts.xCoord, consts.yCoord)

    readonly property int mainRadiusComponent: 2 * consts.radialSize

    // ...
} // QtObject
