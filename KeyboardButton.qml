import QtQuick

Rectangle {
    id: root

    color: functionButton ? "#03396c" : "#353535"
    width: 82
    height: 74
    radius: 7
    border.color: "#222"

    property string text: ""
    property int pixelSize: 24
    property bool functionButton: false

    signal buttonReleased

    Text {
        text: root.text
        color: "white"
        anchors.centerIn: root
        font {
            family: theme.fontRegular
            pixelSize: root.pixelSize
            bold: true
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: root
        onPressed: {
            root.border.width = 2
        }

        onReleased: {
            root.border.width = 0
            if (root.functionButton === false)
            {
                KeyboardHandler.keyPressed(root.text)
            }
            else
            {
                buttonReleased()
            }
        }
    }
}
