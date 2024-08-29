import QtQuick 6.7
import QtQuick.Controls 6.7

Window {
    visible: true
    width: 400
    height: 400
    title: "Exploration des éléments de base"
    property string default_dir: "file:///C:/Users/HP/OneDrive/Documents/"
    property string img: default_dir + "Image20240627161158.png"

    Rectangle {
        width: 400
        height: 400
        color: "lightblue"

        Image {
            source: img
            id:img1
            width:200
            height:200
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
        }

        Text {
            text: "Phrase 1"
            id:t1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: img1.bottom
            anchors.topMargin: 120
        }

        Text {
            text: "Phrase 2"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 150
        }

        Text {
            text: "Phrase 3"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 180
        }

        Button {
            text: "Changer couleur"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
        }
    }
}
