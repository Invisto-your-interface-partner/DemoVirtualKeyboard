import QtQuick
import QtQuick.Controls

Item {
    id: root

    property int spacingBetweenButtons: 10

    anchors.fill: parent

    width: childrenRect.width + (2*root.spacingBetweenButtons /* = the space left and right from the buttons */)
    height: childrenRect.height

    Column {
        id: numericKeyboard

        spacing: root.spacingBetweenButtons

        x: root.spacingBetweenButtons
        y: root.spacingBetweenButtons

        Row {
            id: numericKeyboardFirstRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            ListModel {
                id: firstRowNumeric

                ListElement { first: "1"; second: "Q"; }
                ListElement { first: "2"; second: "W"; }
                ListElement { first: "3"; second: "E"; }
                ListElement { first: "4"; second: "R"; }
                ListElement { first: "5"; second: "T"; }
                ListElement { first: "6"; second: "Y"; }
                ListElement { first: "7"; second: "U"; }
                ListElement { first: "8"; second: "I"; }
                ListElement { first: "9"; second: "O"; }
                ListElement { first: "0"; second: "P"; }
            }

            Repeater {
                model: firstRowNumeric

                KeyboardButton {
                    text: model.first
                }
            }
        }

        Row {
            id: numericKeyboardSecondRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            ListModel {
                id: secondRowNumeric

                ListElement { first: "a"; second: "A"; }
                ListElement { first: "s"; second: "S"; }
                ListElement { first: "d"; second: "d"; }
                ListElement { first: "f"; second: "F"; }
                ListElement { first: "g"; second: "G"; }
                ListElement { first: "h"; second: "H"; }
                ListElement { first: "j"; second: "J"; }
                ListElement { first: "k"; second: "K"; }
                ListElement { first: "l"; second: "L"; }

            }

            Repeater {
                model: secondRowNumeric

                KeyboardButton {
                    text: model.first
                }
            }
        }

        Row {
            id: numericKeyboardThirdRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            KeyboardButton {
                width: 128
                functionButton: true
                text: "Aa"
            }

            ListModel {
                id: thirdRowNumeric

                ListElement { first: "z"; second: "Z"; }
                ListElement { first: "x"; second: "X"; }
                ListElement { first: "c"; second: "C"; }
                ListElement { first: "v"; second: "V"; }
                ListElement { first: "b"; second: "B"; }
                ListElement { first: "n"; second: "N"; }
                ListElement { first: "m"; second: "M"; }
            }


            Repeater {
                model: thirdRowNumeric

                KeyboardButton {
                    text: model.first
                }
            }

            KeyboardButton {
                width: 128
                functionButton: true
                pixelSize: 32
                text: "←"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // root.state = "hidden"

                    }
                }
            }
        }

        Row {
            id: numericKeyboardFourthRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: numericKeyboard.horizontalCenter

            KeyboardButton {
                width: 128
                functionButton: true
                Image {
                    source: "images/keyboard_close_icon.png"
                    anchors.centerIn: parent
                    width: 30
                    height: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        KeyboardHandler.hideKeyboard()

                        // we need to take away the focus from (if any) focused TextInput field
                        root.forceActiveFocus();
                    }
                }
            }

            Item {
                width: 82
                height: 1
            }


            KeyboardButton {
                text: ","
            }


            KeyboardButton {
                width: 256
                text: " "
            }

            KeyboardButton {
                text: "."
            }

            KeyboardButton {
                text: "12#"
                functionButton: true

                onButtonReleased: {
                    keyboardHandler.numericPressed()
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

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        KeyboardHandler.hideKeyboard()

                        // we need to take away the focus from (if any) focused TextInput field
                        root.forceActiveFocus();
                    }
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
