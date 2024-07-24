import QtQuick 2.11

Loader {
    id: loader

    property alias dialog: loader.sourceComponent

    asynchronous: true
    visible: status == Loader.Ready

    onLoaded: {
        item.show();

        loader.item.closeDialog.connect(loader.destroy);
        // ...
    }
} // Loader
