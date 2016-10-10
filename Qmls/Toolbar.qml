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
                property bool pressedFlag: false
    Image {
        smooth: true
        source: "qrc:/Images/Images/Common/toolbarbg.png"
    }

    GridView {
        id: gridView
        width: 800
        height: 75
        cellWidth: 160
        cellHeight: height
        currentIndex: -1
        clip: true
        focus: true
        highlight: hightLight
        model: listModel
        delegate: componentDelegate
    }

    ListModel {
        id: listModel
        ListElement {
            normalSource: "qrc:/Images/Images/Radio/btn_radio_switch_n.png"
            pressedSource: "qrc:/Images/Images/Radio/btn_radio_switch_p.png"
        }
        ListElement {
            normalSource: "qrc:/Images/Images/Radio/btn_auto_search_n.png"
            pressedSource: "qrc:/Images/Images/Radio/btn_auto_search_p.png"
        }
        ListElement {
            normalSource: "qrc:/Images/Images/Radio/btn_prev_n.png"
            pressedSource: "qrc:/Images/Images/Radio/btn_prev_p.png"
        }
        ListElement {
            normalSource: "qrc:/Images/Images/Radio/btn_next_n.png"
            pressedSource: "qrc:/Images/Images/Radio/btn_next_p.png"
        }
        ListElement {
            normalSource: "qrc:/Images/Images/Radio/btn_manual_search_n.png"
            pressedSource: "qrc:/Images/Images/Radio/btn_manual_search_p.png"
        }
    }

    Component {
        id: componentDelegate
        Item {
            width: 160
            height: 75
            Image {
                id: background
                anchors.centerIn: parent
                width: 133
                height: 75
                smooth: true
                source: normalSource
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        pressedFlag = true
                        gridView.currentIndex = index
                    }
                    onReleased: {
                        pressedFlag = false
                        toolbarButtonReleased(gridView.currentIndex)
                    }
                }
            }
        }
    }

    Component {
        id: hightLight
        Rectangle {
//            width: 10
//            height: 75
            smooth: true
//            source: "qrc:/Images/Images/Radio/btn_radio_switch_p.png"
            color: pressedFlag ? "gray" : "green"
            x: gridView.currentItem.x
            Behavior on x {
                NumberAnimation {
                    duration: 250
                }
            }
        }
    }
    //    Row {
    //        x: 22.5
    //        spacing: 22.5
    //        Image {
    //            id: firstButton
    //            smooth: true
    //            source: firstButtonNormalSource
    //            MouseArea {
    //                anchors.fill: parent
    //                onPressed: {
    //                    firstButton.source = firstButtonPressedSource
    //                }
    //                onReleased: {
    //                    firstButton.source = firstButtonNormalSource
    //                    toolbarButtonReleased(0)
    //                }
    //            }
    //        }

    //        Image {
    //            id: secondButton
    //            smooth: true
    //            source: secondButtonNormalSource
    //            MouseArea {
    //                anchors.fill: parent
    //                onPressed: {
    //                    secondButton.source = secondButtonPressedSource
    //                    __toolbarButtonLongPressed = 1
    //                    timer.start()
    //                }
    //                onReleased: {
    //                    if (timer.running) {
    //                        __toolbarButtonLongPressed = -1
    //                        timer.stop()
    //                        secondButton.source = secondButtonNormalSource
    //                        toolbarButtonReleased(1)
    //                    }
    //                }
    //            }
    //        }

    //        Image {
    //            id: thirdButton
    //            smooth: true
    //            source: thirdButtonNormalSource
    //            MouseArea {
    //                anchors.fill: parent
    //                onPressed: {
    //                    thirdButton.source = thirdButtonPressedSource
    //                    __toolbarButtonLongPressed = 2
    //                    timer.start()
    //                }
    //                onReleased: {
    //                    if (timer.running) {
    //                        __toolbarButtonLongPressed = -1
    //                        timer.stop()
    //                        thirdButton.source = thirdButtonNormalSource
    //                        toolbarButtonReleased(2)
    //                    }
    //                }
    //            }
    //        }

    //        Image {
    //            id: fourButton
    //            smooth: true
    //            source: fourButtonNormalSource
    //            MouseArea {
    //                anchors.fill: parent
    //                onPressed: {
    //                    fourButton.source = fourButtonPressedSource
    //                    __toolbarButtonLongPressed = 3
    //                    timer.start()
    //                }
    //                onReleased: {
    //                    if (timer.running) {
    //                        __toolbarButtonLongPressed = -1
    //                        timer.stop()
    //                        fourButton.source = fourButtonNormalSource
    //                        toolbarButtonReleased(3)
    //                    }
    //                }
    //            }
    //        }
    //        Image {
    //            id: fiveButton
    //            smooth: true
    //            source: fiveButtonNormalSource
    //            MouseArea {
    //                anchors.fill: parent
    //                onPressed: {
    //                    fiveButton.source = fiveButtonPressedSource
    //                }
    //                onReleased: {
    //                    fiveButton.source = fiveButtonNormalSource
    //                    toolbarButtonReleased(4)
    //                }
    //            }
    //        }
    //    }

    //    Timer {
    //        id: timer
    //        interval: 1500
    //        running: false
    //        repeat: false
    //        onTriggered: {
    //            if (-1 !== __toolbarButtonLongPressed) {
    //                toolbarButtonLongPressed(__toolbarButtonLongPressed)
    //            }
    //        }
    //    }

    function setButtonPressed(index) {
        console.log("setButtonPressed", index)
//        firstButton.source = firstButtonPressedSource
    }
}
