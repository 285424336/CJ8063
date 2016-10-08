import QtQuick 2.2
import QtQuick.Controls 1.4

Rectangle {
    x: parent.x + parent.width / 2
    width: 388
    height: 480 - 64 - 75
    color: "gray"

    Image {
        width: 388
        height: 480 - 64 - 75
        source: "qrc:/Images/Images/Common/listviewbg.png"
    }

    Component {
        id: delegate
        Item {
            id: wrapper
            width: 180
            height: 40
            property bool flag: false
            property variant mymodel: model
            Rectangle {
                id: background
                color: "transparent"
                anchors.fill: parent
                Image {
                    id: frontground
                    source: ""
                }
                Column {
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
                        wrapper.flag = true
                    }
                    onReleased: {
                        frontground.source = ""
                        console.log("onReleased", index)
                        wrapper.ListView.view.currentIndex = index
                    }
                    onMouseYChanged: {
                        console.log("onMouseYChanged", index)
                        if (!wrapper.flag) {
                            frontground.source = ""
                        } else {
                            wrapper.flag = !wrapper.flag
                        }
                    }
                }
            }
        }
    }

    Component {
        id: highlight
        Image {
            width: 180
            height: 40
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

    Rectangle {
        id: scrollbar
        anchors.right: listView.right
        width: 20
        height: parent.height
        color: "blue"
        Rectangle {
            id: button
            y: listView.visibleArea.yPosition * scrollbar.height
            width: 20
            height: listView.visibleArea.heightRatio * scrollbar.height
            color: "green"
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                drag.target: button
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: scrollbar.height - button.height
                onPressed: {
                    button.color = "black"
                }
                onReleased: {
                    button.color = "green"
                }
                onMouseYChanged: {
                    listView.contentY = button.y / scrollbar.height * listView.contentHeight
                }
            }
        }
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
    }
}
