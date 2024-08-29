// InteractiveRectangle.qml
import QtQuick 2.15

Rectangle {
    id: interactiveRect
    width: 100; height: 100
    color: "red"

    signal rectangleClicked
    signal keyPressed(string key)

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.log("Bonjour")
            interactiveRect.color = "green"
            interactiveRect.rectangleClicked()
        }
    }

    Keys.onPressed: (event) => {
    interactiveRect.keyPressed(event.key)
        if (event.key === Qt.Key_R) {
            interactiveRect.color = "red"
        } else if (event.key === Qt.Key_B) {
            interactiveRect.color = "blue"
        }
    }
}
