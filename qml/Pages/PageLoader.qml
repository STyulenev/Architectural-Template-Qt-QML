import QtQml 2.15
import QtQuick 2.15

Loader {
    id: loader

    property alias page: loader.sourceComponent

    property string pageName: loader.item && loader.item.pageName ? loader.item.pageName : ""
    property string objectName: loader.item && loader.item.objectName ? loader.item.objectName : ""

    signal back()
    signal next(Component page)
    // дополнительные сигналы для логики перехода между страницами

    asynchronous: true

    onLoaded: {
        item.view ? item.view.visibleChanged(true) : { };

        loader.item.back.connect(loader.back);
        loader.item.next.connect(loader.next);

        // дополнительные соединения для логики перехода между страницами
    }
} // Loader
