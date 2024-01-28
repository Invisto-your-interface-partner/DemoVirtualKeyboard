import QtQuick
import libs.keyboard

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    VirtualKeyboard {
        counter:10
    }
}
