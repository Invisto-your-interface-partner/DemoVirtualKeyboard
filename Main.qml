import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
    id: window
    width: 880
    height: 720

    visible: true
    title: qsTr("Virtual Keyboard Demo")

    Item {
        id: theme

        property alias fontRegular: fontLoaderRegular.name

        FontLoader
        {
            id: fontLoaderRegular
            source: "fonts/VAG_Rounded_Regular.ttf"
        }
    }

    Pane {
        anchors.fill: window
        focusPolicy: Qt.ClickFocus
    }

    ScreenContent {
        width: window.width
    }

    Keyboard {
        state: KeyboardHandler.showKeyboard ? "visible" : "hidden"
        useNumericKeyboard: KeyboardHandler.useNumericKeyboard
        useCaps: KeyboardHandler.useCaps
    }
}

