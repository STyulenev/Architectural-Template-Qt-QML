import QtQml 2.15
import QtQuick 2.15

Loader {
    id: loader

    property string screenName: loader.item && loader.item.screenName ? loader.item.screenName : ""
    property string objectName: loader.item && loader.item.objectName ? loader.item.objectName : ""
    property alias screen: loader.sourceComponent

    signal exit()
    signal next(Component screen)
    // дополнительные сигналы для логики перехода

    asynchronous: true

    onLoaded: {
        item.view ? item.view.visibleChanged(true) : { }

        loader.item.exit.connect(loader.exit)
        loader.item.next.connect(loader.next)

        // дополнительные соединения для логики перехода
    }
}
