import QtQuick 2.6

Rectangle {
    id: toolbar
    color: "transparent"
    width: parent.width
    height: 75
    property string firstButtonNormalSource: ""
    property string firstButtonPressedSource: ""
    property string secondButtonNormalSource: ""
    property string secondButtonPressedSource: ""
    property string thirdButtonNormalSource: ""
    property string thirdButtonPressedSource: ""
    property string fourButtonNormalSource: ""
    property string fourButtonPressedSource: ""
    property string fiveButtonNormalSource: ""
    property string fiveButtonPressedSource: ""
    signal toolbarButtonReleased(int index)
    property int __toolbarButtonLongPressed: -1
    signal toolbarButtonLongPressed(int index)

    Image {
        smooth: true
        source: "qrc:/Images/Images/Common/toolbarbg.png"
    }

    Row {
        x: 22.5
        spacing: 22.5
        Image {
            id: firstButton
            smooth: true
            source: firstButtonNormalSource
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    firstButton.source = firstButtonPressedSource
                }
                onReleased: {
                    firstButton.source = firstButtonNormalSource
                    toolbarButtonReleased(0)
                }
            }
        }

        Image {
            id: secondButton
            smooth: true
            source: secondButtonNormalSource
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    secondButton.source = secondButtonPressedSource
                    __toolbarButtonLongPressed = 1
                    timer.start()
                }
                onReleased: {
                    if (timer.running) {
                        __toolbarButtonLongPressed = -1
                        timer.stop()
                        secondButton.source = secondButtonNormalSource
                        toolbarButtonReleased(1)
                    }
                }
            }
        }

        Image {
            id: thirdButton
            smooth: true
            source: thirdButtonNormalSource
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    thirdButton.source = thirdButtonPressedSource
                    __toolbarButtonLongPressed = 2
                    timer.start()
                }
                onReleased: {
                    if (timer.running) {
                        __toolbarButtonLongPressed = -1
                        timer.stop()
                        thirdButton.source = thirdButtonNormalSource
                        toolbarButtonReleased(2)
                    }
                }
            }
        }

        Image {
            id: fourButton
            smooth: true
            source: fourButtonNormalSource
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    fourButton.source = fourButtonPressedSource
                    __toolbarButtonLongPressed = 3
                    timer.start()
                }
                onReleased: {
                    if (timer.running) {
                        __toolbarButtonLongPressed = -1
                        timer.stop()
                        fourButton.source = fourButtonNormalSource
                        toolbarButtonReleased(3)
                    }
                }
            }
        }
        Image {
            id: fiveButton
            smooth: true
            source: fiveButtonNormalSource
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    fiveButton.source = fiveButtonPressedSource
                }
                onReleased: {
                    fiveButton.source = fiveButtonNormalSource
                    toolbarButtonReleased(4)
                }
            }
        }
    }

    Timer {
        id: timer
        interval: 1500
        running: false
        repeat: false
        onTriggered: {
            if (-1 !== __toolbarButtonLongPressed) {
                toolbarButtonLongPressed(__toolbarButtonLongPressed)
            }
        }
    }

    function setButtonPressed(index) {
        console.log("setButtonPressed", index)
        firstButton.source = firstButtonPressedSource
    }
}
