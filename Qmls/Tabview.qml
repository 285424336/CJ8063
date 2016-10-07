import QtQuick 2.6

Rectangle {
    id: tabview
    color: "transparent"
    visible: true
    width: parent.width
    height: background.height
    signal buttonReleased(int index)
    property int currentPage: 0

    Image {
        id: background
        source: "qrc:/Images/Images/Common/tabback.png"
    }

    Image {
        x: (64 + 112 / 2 + 112 * currentPage) - 200 / 2
        visible: (0 === currentPage) ? false : true
        source: "qrc:/Images/Images/Common/tabcurrent.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Tabview MouseArea", mouseX, mouseY)
            }
        }
    }

    Row {
        x: 64
        Image {
            id: homeButton
            source: (0 === currentPage)
                    ? "qrc:/Images/Images/Common/tab_home_p.png"
                    : "qrc:/Images/Images/Common/tab_home_n.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonReleased(0)
                }
            }
        }

        Image {
            id: radioButton
            source: (1 === currentPage)
                    ? "qrc:/Images/Images/Common/tab_radio_p.png"
                    : "qrc:/Images/Images/Common/tab_radio_n.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonReleased(1)
                }
            }
        }

        Image {
            id: usbButton
            source: (2 === currentPage)
                    ? "qrc:/Images/Images/Common/tab_udisk_p.png"
                    : "qrc:/Images/Images/Common/tab_udisk_n.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonReleased(2)
                }
            }
        }

        Image {
            id: phoneButton
            source: (3 === currentPage)
                    ? "qrc:/Images/Images/Common/tab_phone_p.png"
                    : "qrc:/Images/Images/Common/tab_phone_n.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonReleased(3)
                }
            }
        }

        Image {
            id: voiceButton
            source: (4 === currentPage)
                    ? "qrc:/Images/Images/Common/tab_voice_p.png"
                    : "qrc:/Images/Images/Common/tab_voice_n.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonReleased(4)
                }
            }
        }

        Image {
            id: settingButton
            source: (5 === currentPage)
                    ? "qrc:/Images/Images/Common/tab_setting_p.png"
                    : "qrc:/Images/Images/Common/tab_setting_n.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonReleased(5)
                }
            }
        }
    }
}
