import QtQuick 2.2
import QtQuick.Controls 1.4

Rectangle {
    x: 12 + parent.width / 2 - 42
    width: 388
    height: 480 - 64 - 75
    color: "transparent"

    Image {
        width: 388
        height: 480 - 64 - 75
        source: "qrc:/Images/Images/Common/listviewbg.png"
    }

    Component {
        id: delegate
        Item {
            id: wrapper
            width: 388
            height: 52
            property bool pressFlag: false
            property int moveCount: 0
            property variant mymodel: model
            Rectangle {
                id: background
                color: "transparent"
                anchors.fill: parent
                Image {
                    anchors.fill: parent
                    id: frontground
                    source: ""
                    Image {
                        anchors.top: parent.bottom
                        anchors.topMargin: 1
                        source: "qrc:/Images/Images/Common/list_line.png"
                    }
                }
                Column {
                    anchors.centerIn: parent
                    x: 5
                    y: 5
                    Text {
                        color: "white"
                        text: name
                    }
                    Text {
                        color: "white"
                        text: value
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        console.log("onPressed", index)
                        frontground.source = "qrc:/Images/Images/Common/listitem_pressed.png"
                        //                        contactModel.append({"name": "frequency", "value": "88.9"})
                        wrapper.pressFlag = true
                        wrapper.moveCount = 0
                    }
                    onReleased: {
                        if (wrapper.moveCount < 2) {
                            frontground.source = ""
                            console.log("onReleased", index, wrapper.pressFlag)
                            wrapper.ListView.view.currentIndex = index
                        }
                    }
                    onMouseYChanged: {
//                        console.log("onMouseYChanged", index)
                        ++wrapper.moveCount
                        if (!wrapper.pressFlag) {
                            frontground.source = ""
                        } else {
                            wrapper.pressFlag = !wrapper.pressFlag
                        }
                    }
                }
            }
        }
    }

    Component {
        id: highlight
        Image {
            width: 388
            height: 52
            source: "qrc:/Images/Images/Common/list_select.png"
            y: listView.currentItem.y
            Behavior on y {
                NumberAnimation {
                    duration: 250
                }
            }
        }
    }

    ListView {
        id: listView
        width: parent.width
        height: parent.height
        orientation: ListView.Vertical
        spacing: 5
        model: contactModel
        delegate: delegate
        highlight: highlight
        clip: true
        onContentYChanged: {
            console.log("onContentYChanged", contentY)
        }
        onCurrentIndexChanged: {
            console.log(listView.currentIndex)
            console.log(listView.currentItem.mymodel.name)
        }
    }

    Image {
        id: topButton
        anchors.left: listView.right
        //        anchors.leftMargin: -3
        anchors.top: parent.top
        source: "qrc:/Images/Images/Common/scroller_top_n .png"
    }

    Item {
        id: scrollbar
        anchors.left: listView.right
        anchors.top: topButton.bottom
        anchors.bottom: bottomButton.top
        width: 42
        height: parent.height - topButton.height - bottomButton.height
        Image {
            id: scroll
            y: getYPosititon()
            onYChanged: {
                console.log("getYPosititon", scroll.y)
            }
            //            width: 42
            //            height: listView.visibleArea.heightRatio * scrollbar.height
            source: "qrc:/Images/Images/Common/scroller_center_n.png"
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                drag.target: scroll
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: scrollbar.height - scroll.height
                onPressed: {
//                    console.log("hahaonPressed");
                }
                onReleased: {
//                    console.log("hahaonReleased");
                }
                onMouseYChanged: {
                    console.log("haha", scroll.y)
                    listView.contentY = getContenY()
                }
                function getContenY() {
                    return scroll.y / (scrollbar.height - scroll.height) * (listView.contentHeight - listView.height)
                }
            }
            function getYPosititon() {
                var ret = 0.0000000000000000
                if (listView.visibleArea.yPosition <= 0) {
                    topButton.visible = false
                    ret = 0
                } else if (listView.visibleArea.heightRatio + listView.visibleArea.yPosition >= 1) {
                    bottomButton.visible = false
                    ret = scrollbar.height - scroll.height
                } else {
                    topButton.visible = true
                    bottomButton.visible = true
                    ret = (listView.visibleArea.yPosition / (1 - listView.visibleArea.heightRatio)) * (scrollbar.height - scroll.height)
                }
                return ret
            }
        }
    }

    Image {
        id: bottomButton
        anchors.left: listView.right
        //        anchors.leftMargin: -3
        anchors.bottom: parent.bottom
        source: "qrc:/Images/Images/Common/scroller_bottom_n.png"
    }

    ListModel {
        id: contactModel
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
        ListElement {
            name: "frequency"
            value: "88.0"
        }
    }
}
