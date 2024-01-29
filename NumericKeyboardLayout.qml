import QtQuick
import QtQuick.Controls

Item {
    id: root

    property int spacingBetweenButtons: 10
    property bool useSecond: false

    //anchors.fill: parent
    anchors.horizontalCenter: parent.horizontalCenter

    width: childrenRect.width + (2*root.spacingBetweenButtons /* = the space left and right from the buttons */)
    height: childrenRect.height

    Column {
        id: numericKeyboard

        spacing: root.spacingBetweenButtons

        x: root.spacingBetweenButtons
        y: root.spacingBetweenButtons

        Row {
            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            Repeater {
                model: ["7", "8", "9"]

                KeyboardButton {
                    text: modelData
                }
            }

            KeyboardButton {
                width: 128
                functionButton: true
                pixelSize: 32
                text: "←"

                onButtonReleased: KeyboardHandler.backSpacePressed()
            }
        }

        Row {
            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            Repeater {
                model: ["4", "5", "6"]

                KeyboardButton {
                    text: modelData
                }
            }

            KeyboardButton {
                width: 128
                functionButton: true
                Image {
                    source: "images/noun-return.png"
                    anchors.centerIn: parent
                    width: 30
                    height: 30
                }

                onButtonReleased: KeyboardHandler.enterPressed()
            }
        }

        Row {
            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            Repeater {
                model: ["1", "2", "3"]

                KeyboardButton {
                    text: modelData
                }
            }

            KeyboardButton {
                width: 128
                functionButton: true
                text: "😐"
            }
        }

        Row {
            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            Repeater {
                model: [" ", ",", "."]

                KeyboardButton {
                    text: modelData
                }
            }

            KeyboardButton {
                width: 128
                functionButton: true
                Image {
                    source: "images/keyboard_close_icon.png"
                    anchors.centerIn: parent
                    width: 30
                    height: 30
                }

                onButtonReleased: {
                    KeyboardHandler.hideKeyboard()

                    // we need to take away the focus from (if any) focused TextInput field
                    root.forceActiveFocus();
                }
            }
        }

        Item {
            // spacing at the bottom of the keyboard
            height: root.spacingBetweenButtons
            width: 1
        }
    }
}
