import QtQml 2.11
import QtQuick 2.11

Loader {
    id: loader

    property alias page: loader.sourceComponent

    property string pageName: loader.item && loader.item.pageName ? loader.item.pageName : ""

    signal back()
    signal next(Component page)
    // дополнительные сигналы для логики перехода между страницами

    asynchronous: true
    visible: status == Loader.Ready

    onLoaded: {
        loader.item.view ? loader.item.view.visibleChanged(true) : { };

        loader.item.back.connect(loader.back);
        loader.item.next.connect(loader.next);

        // дополнительные соединения для логики перехода между страницами
    }
} // Loader
