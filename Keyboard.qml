import QtQuick
import QtQuick.Controls

Rectangle {
    id: root

    width: root.useNumericKeyboard ? numericKeyboardLayout.width : mainKeyboardLayout.width
    height: root.useNumericKeyboard ? numericKeyboardLayout.height : mainKeyboardLayout.height

    color: "#0F101A"
    opacity: 0.9

    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter

    state: "hidden"

    property bool useNumericKeyboard: false
    property bool useCaps: false

    QtObject {
        id: internals

        readonly property int spacingBetweenButtons: 5
    }

    // Add a MouseArea so yo cannot click on items behind the keyboard
    MouseArea {
        anchors.fill: parent
    }

    Item {
        id: numericKeyboardLayout

        visible: root.useNumericKeyboard

        anchors.fill: parent

        width: childrenRect.width + (2*internals.spacingBetweenButtons /* = the space left and right from the buttons */)
        height: childrenRect.height

        Column {
            id: numericKeyboard

            spacing: internals.spacingBetweenButtons

            x: internals.spacingBetweenButtons
            y: internals.spacingBetweenButtons

            Row {
                id: numericKeyboardFirstRow

                spacing: internals.spacingBetweenButtons
                anchors.horizontalCenter: numericKeyboard.horizontalCenter

                ListModel {
                    id: firstRowNumeric

                    ListElement { first: "1"; second: "Q"; numbersAndSymbols: "1" }
                    ListElement { first: "2"; second: "W"; numbersAndSymbols: "2" }
                    ListElement { first: "3"; second: "E"; numbersAndSymbols: "3" }
                    ListElement { first: "4"; second: "R"; numbersAndSymbols: "4" }
                    ListElement { first: "5"; second: "T"; numbersAndSymbols: "5" }
                    ListElement { first: "6"; second: "Y"; numbersAndSymbols: "6" }
                    ListElement { first: "7"; second: "U"; numbersAndSymbols: "7" }
                    ListElement { first: "8"; second: "I"; numbersAndSymbols: "8" }
                    ListElement { first: "9"; second: "O"; numbersAndSymbols: "9" }
                    ListElement { first: "0"; second: "P"; numbersAndSymbols: "0" }
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

                spacing: internals.spacingBetweenButtons
                anchors.horizontalCenter: numericKeyboard.horizontalCenter

                ListModel {
                    id: secondRowNumeric

                    ListElement { first: "a"; second: "A"; numbersAndSymbols: "!" }
                    ListElement { first: "s"; second: "S"; numbersAndSymbols: "@" }
                    ListElement { first: "d"; second: "d"; numbersAndSymbols: "#" }
                    ListElement { first: "f"; second: "F"; numbersAndSymbols: "4" }
                    ListElement { first: "g"; second: "G"; numbersAndSymbols: "$" }
                    ListElement { first: "h"; second: "H"; numbersAndSymbols: "%" }
                    ListElement { first: "j"; second: "J"; numbersAndSymbols: "&" }
                    ListElement { first: "k"; second: "K"; numbersAndSymbols: "*" }
                    ListElement { first: "l"; second: "L"; numbersAndSymbols: "?" }

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

                spacing: internals.spacingBetweenButtons
                anchors.horizontalCenter: numericKeyboard.horizontalCenter

                KeyboardButton {
                    width: 128
                    functionButton: true
                    text: "Aa"
                }

                ListModel {
                    id: thirdRowNumeric

                    ListElement { first: "z"; second: "Z"; numbersAndSymbols: "_" }
                    ListElement { first: "x"; second: "X"; numbersAndSymbols: "\"" }
                    ListElement { first: "c"; second: "C"; numbersAndSymbols: "\'" }
                    ListElement { first: "v"; second: "V"; numbersAndSymbols: "(" }
                    ListElement { first: "b"; second: "B"; numbersAndSymbols: ")" }
                    ListElement { first: "n"; second: "N"; numbersAndSymbols: "-" }
                    ListElement { first: "m"; second: "M"; numbersAndSymbols: "+" }
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

                spacing: internals.spacingBetweenButtons
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
                height: internals.spacingBetweenButtons
                width: 1
            }
        }
    }


    Item {
        id: mainKeyboardLayout

        visible: root.useNumericKeyboard === false

        width: childrenRect.width + (2*internals.spacingBetweenButtons /* = the space left and right from the buttons */)
        height: childrenRect.height

        Column {
            id: mainKeyboard

            spacing: internals.spacingBetweenButtons

            x: internals.spacingBetweenButtons
            y: internals.spacingBetweenButtons

            Row {
                id: mainKeyboardFirstRow

                spacing: internals.spacingBetweenButtons
                anchors.horizontalCenter: mainKeyboard.horizontalCenter

                ListModel {
                    id: firstRowAlphabetical

                    ListElement { noCaps: "q"; caps: "Q"; numbersAndSymbols: "1" }
                    ListElement { noCaps: "w"; caps: "W"; numbersAndSymbols: "2" }
                    ListElement { noCaps: "e"; caps: "E"; numbersAndSymbols: "3" }
                    ListElement { noCaps: "r"; caps: "R"; numbersAndSymbols: "4" }
                    ListElement { noCaps: "t"; caps: "T"; numbersAndSymbols: "5" }
                    ListElement { noCaps: "y"; caps: "Y"; numbersAndSymbols: "6" }
                    ListElement { noCaps: "u"; caps: "U"; numbersAndSymbols: "7" }
                    ListElement { noCaps: "i"; caps: "I"; numbersAndSymbols: "8" }
                    ListElement { noCaps: "o"; caps: "O"; numbersAndSymbols: "9" }
                    ListElement { noCaps: "p"; caps: "P"; numbersAndSymbols: "0" }
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

                spacing: internals.spacingBetweenButtons
                anchors.horizontalCenter: mainKeyboard.horizontalCenter

                ListModel {
                    id: secondRowAlphabetical

                    ListElement { noCaps: "a"; caps: "A"; numbersAndSymbols: "!" }
                    ListElement { noCaps: "s"; caps: "S"; numbersAndSymbols: "@" }
                    ListElement { noCaps: "d"; caps: "d"; numbersAndSymbols: "#" }
                    ListElement { noCaps: "f"; caps: "F"; numbersAndSymbols: "4" }
                    ListElement { noCaps: "g"; caps: "G"; numbersAndSymbols: "$" }
                    ListElement { noCaps: "h"; caps: "H"; numbersAndSymbols: "%" }
                    ListElement { noCaps: "j"; caps: "J"; numbersAndSymbols: "&" }
                    ListElement { noCaps: "k"; caps: "K"; numbersAndSymbols: "*" }
                    ListElement { noCaps: "l"; caps: "L"; numbersAndSymbols: "?" }

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

                spacing: internals.spacingBetweenButtons
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

                    ListElement { noCaps: "z"; caps: "Z"; numbersAndSymbols: "_" }
                    ListElement { noCaps: "x"; caps: "X"; numbersAndSymbols: "\"" }
                    ListElement { noCaps: "c"; caps: "C"; numbersAndSymbols: "\'" }
                    ListElement { noCaps: "v"; caps: "V"; numbersAndSymbols: "(" }
                    ListElement { noCaps: "b"; caps: "B"; numbersAndSymbols: ")" }
                    ListElement { noCaps: "n"; caps: "N"; numbersAndSymbols: "-" }
                    ListElement { noCaps: "m"; caps: "M"; numbersAndSymbols: "+" }
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

                spacing: internals.spacingBetweenButtons
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
                height: internals.spacingBetweenButtons
                width: 1
            }
        }
    }



    states: [
        State {
            name: "hidden"
            PropertyChanges { target: root; anchors.bottomMargin: -root.height }
        },
        State {
            name: "visible"
            PropertyChanges { target: root; anchors.bottomMargin: 0 }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "anchors.bottomMargin"; easing.type: Easing.InOutQuad; duration: 200 }
    }
}
