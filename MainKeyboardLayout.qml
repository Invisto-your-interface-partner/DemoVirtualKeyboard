import QtQuick
import QtQuick.Controls

Item {
    id: root

    property int spacingBetweenButtons: 10
    property bool useCaps: false

    width: childrenRect.width + (2*root.spacingBetweenButtons /* = the space left and right from the buttons */)
    height: childrenRect.height

    Column {
        id: mainKeyboard

        spacing: root.spacingBetweenButtons

        x: root.spacingBetweenButtons
        y: root.spacingBetweenButtons

        Row {
            id: mainKeyboardFirstRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: mainKeyboard.horizontalCenter

            ListModel {
                id: firstRowAlphabetical

                ListElement { noCaps: "q"; caps: "Q"; }
                ListElement { noCaps: "w"; caps: "W"; }
                ListElement { noCaps: "e"; caps: "E"; }
                ListElement { noCaps: "r"; caps: "R"; }
                ListElement { noCaps: "t"; caps: "T"; }
                ListElement { noCaps: "y"; caps: "Y"; }
                ListElement { noCaps: "u"; caps: "U"; }
                ListElement { noCaps: "i"; caps: "I"; }
                ListElement { noCaps: "o"; caps: "O"; }
                ListElement { noCaps: "p"; caps: "P"; }
            }

            Repeater {
                model: firstRowAlphabetical

                KeyboardButton {
                    text: root.useCaps ? model.caps : model.noCaps
                }
            }
        }

        Row {
            id: mainKeyboardSecondRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: mainKeyboard.horizontalCenter

            ListModel {
                id: secondRowAlphabetical

                ListElement { noCaps: "a"; caps: "A"; }
                ListElement { noCaps: "s"; caps: "S"; }
                ListElement { noCaps: "d"; caps: "d"; }
                ListElement { noCaps: "f"; caps: "F"; }
                ListElement { noCaps: "g"; caps: "G"; }
                ListElement { noCaps: "h"; caps: "H"; }
                ListElement { noCaps: "j"; caps: "J"; }
                ListElement { noCaps: "k"; caps: "K"; }
                ListElement { noCaps: "l"; caps: "L"; }

            }

            Repeater {
                model: secondRowAlphabetical

                KeyboardButton {
                    text: root.useCaps ? model.caps : model.noCaps
                }
            }
        }

        Row {
            id: mainKeyboardThirdRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: mainKeyboard.horizontalCenter

            KeyboardButton {
                width: 128
                functionButton: true
                text: "Aa"

                onButtonReleased: {
                    KeyboardHandler.useCaps = !KeyboardHandler.useCaps
                }
            }

            ListModel {
                id: thirdRowAlphabetical

                ListElement { noCaps: "z"; caps: "Z"; }
                ListElement { noCaps: "x"; caps: "X"; }
                ListElement { noCaps: "c"; caps: "C"; }
                ListElement { noCaps: "v"; caps: "V"; }
                ListElement { noCaps: "b"; caps: "B"; }
                ListElement { noCaps: "n"; caps: "N"; }
                ListElement { noCaps: "m"; caps: "M"; }
            }


            Repeater {
                model: thirdRowAlphabetical

                KeyboardButton {
                    text: root.useCaps ? model.caps : model.noCaps
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
            id: mainKeyboardFourthRow

            spacing: root.spacingBetweenButtons
            anchors.horizontalCenter: mainKeyboard.horizontalCenter

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

                onButtonReleased: KeyboardHandler.requestNumericKeyboard()
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

        Item {
            // spacing at the bottom of the keyboard
            height: root.spacingBetweenButtons
            width: 1
        }
    }
}
