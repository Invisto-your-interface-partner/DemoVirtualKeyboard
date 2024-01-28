import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
    width: 880
    height: 800

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
        anchors.fill: parent
        focusPolicy: Qt.ClickFocus
    }

    TextInput {
        text: "testke"
        width: 100
        height: 20
        color: "pink"
        y: 500
        font.family: theme.fontRegular

        // inputMethodHints : Qt.ImhFormattedNumbersOnly
    }


    TextInput {
        text: "testke"
        width: 100
        height: 20
        color: "pink"
        x: 500
        y: 500

        inputMethodHints : Qt.ImhFormattedNumbersOnly
    }

    Keyboard {
        state: KeyboardHandler.showKeyboard ? "visible" : "hidden"
        useNumericKeyboard: KeyboardHandler.useNumericKeyboard
    }
}

