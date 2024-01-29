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


    NumericKeyboardLayout {
        id: numericKeyboardLayout
        visible: root.useNumericKeyboard
        spacingBetweenButtons: internals.spacingBetweenButtons
    }

    MainKeyboardLayout {
        id: mainKeyboardLayout
        visible: !root.useNumericKeyboard
        spacingBetweenButtons: internals.spacingBetweenButtons
        useCaps: root.useCaps
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
