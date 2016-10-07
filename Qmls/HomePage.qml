import QtQuick 2.2

Rectangle {
    id: homePage
    color: "transparent"
    width: 800
    height: 480
    property int __homeButtonReleased: -1
    signal homeButtonReleased(int index)

    ParallelAnimation {
        id: showAnimation
        running: false
        NumberAnimation {
            target: homePage
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 500
        }
    }

    onVisibleChanged: {
        if (visible) {
            showAnimation.start()
        } else {
            __homeButtonReleased = -1
        }
    }

    GridView {
        id: gridView
        anchors.fill: parent
        anchors.leftMargin: 22
        anchors.topMargin: 60
        cellWidth: 151
        cellHeight: 211
        currentIndex: -1
        model: listModel
        delegate: componentDelegate
    }

    ListModel {
        id: listModel
        ListElement {
            textTitle: "Radio"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_Radio_n.png"
        }
        ListElement {
            textTitle: "USB"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_USB_n.png"
        }
        ListElement {
            textTitle: "Bluetooth"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_BTMusic_n.png"
        }
        ListElement {
            textTitle: "iPod"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_IPod_n.png"
        }
        ListElement {
            textTitle: "Carplay"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_Carplay_n.png"
        }
        ListElement {
            textTitle: "Carlife"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_Carlife_n.png"
        }
        ListElement {
            textTitle: "Phone"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_Phone_n.png"
        }
        ListElement {
            textTitle: "Voice"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_Voice_n.png"
        }
        ListElement {
            textTitle: "Setting"
            normalSource: "qrc:/Images/Images/Common/HomeIcon_Setting_n.png"
        }
    }

    Component {
        id: componentDelegate
        Item {
            id: button
            state: "released"
            width: 151
            height: 151
            Image {
                id: background
                anchors.left:  parent.left
                anchors.leftMargin: 22
                smooth: true
                source: normalSource
            }
            Image {
                id: frontground
                anchors.left:  parent.left
                anchors.leftMargin: 22
                smooth: true
                visible: false
                source: "qrc:/Images/Images/Common/HomeIcon_Background.png"
            }
            Text {
                id: title
                color: "white"
                font.pixelSize: 32
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
                y: background.height
                text: textTitle
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button.state = "pressed"
                }
                onReleased: {
                    button.state = "released"
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
                if ("released" === state) {
                    buttonReleased(index)
                }
                console.log("onStateChanged", state)
            }
        }
    }


//    on__HomeButtonReleasedChanged: {
//        if (-1 !== __homeButtonReleased) {
//            homeButtonReleased(__homeButtonReleased)
//        }
//    }
}
