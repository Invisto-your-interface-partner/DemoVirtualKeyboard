import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
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
        anchors.fill: parent
        focusPolicy: Qt.ClickFocus
    }

    Column {
        width: parent.width

        spacing: 10

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            height: 30

            color: "#0F101A"

            TextInput {
                text: "One line field"
                width: parent.width - 5
                x: 5
                height: parent.height
                color: "white"
                font.family: theme.fontRegular
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            height: 30

            color: "#0F101A"

            TextInput {
                text: "Password field"
                width: parent.width - 5
                x: 5
                height: parent.height
                color: "white"
                font.family: theme.fontRegular
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter

                echoMode: TextInput.Password
            }
        }

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            height: 30

            color: "#0F101A"

            TextInput {
                text: "1234566789"
                width: parent.width - 5
                x: 5
                height: parent.height
                color: "white"
                font.family: theme.fontRegular
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter

                inputMethodHints : Qt.ImhFormattedNumbersOnly
            }
        }

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            height: 90

            color: "#0F101A"

            TextEdit {
                text: "Multiple lines"
                width: parent.width - 5
                x: 5
                height: parent.height
                color: "white"
                font.family: theme.fontRegular
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Keyboard {
        state: KeyboardHandler.showKeyboard ? "visible" : "hidden"
        useNumericKeyboard: KeyboardHandler.useNumericKeyboard
        useCaps: KeyboardHandler.useCaps
    }
}

