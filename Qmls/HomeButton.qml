import QtQuick 2.2

Rectangle {
    id: homeButton
    width: 108
    height: 108
    color: "transparent"
    state: "released"
    property int buttonIndex
    property string titleText: ""
    property string backgroundSource: ""
    signal buttonReleased(int index)

    Image {
        id: background
        anchors.fill: parent
        smooth: true
        source: backgroundSource
    }

    Image {
        id: frontground
        anchors.fill: parent
        visible: false
        smooth: true
        source: "qrc:/Images/Images/Common/HomeIcon_Background.png"
    }

    Text {
        id: title
        color: "white"
        font.pixelSize: 32
        anchors.horizontalCenter: parent.horizontalCenter
        smooth: true
        y: parent.height
        text: titleText
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            homeButton.state = "pressed"
        }
        onReleased: {
            homeButton.state = "released"
        }
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: frontground
                visible: true
            }
        },
        State {
            name: "released"
            PropertyChanges {
                target: frontground
                visible: false
            }
        }
    ]

    onStateChanged: {
        console.log("onStateChanged HomeButton", state)
        if ("released" === state) {
            buttonReleased(buttonIndex)
        }
    }
}
