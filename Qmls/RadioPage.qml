import QtQuick 2.2
import Radio.Instance.RadioInstance 1.0

Rectangle {
    id: radioPage
    color: "transparent"
    width: parent.width
    height: parent.height - 65
    property Toolbar toolbar: null
    property RadioListView radioListView: null

    SequentialAnimation {
        id: showAnimation
        NumberAnimation {
            target: radioPage
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 350
        }
    }

    Text {
        id: effect
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.top: parent.top
        anchors.topMargin: 30
        color: "white"
        smooth: true
        font.pixelSize: 26
        text: qsTr("Standard")
    }

    Text {
        id: stereo
        anchors.left: effect.right
        anchors.leftMargin: 45
        anchors.top: parent.top
        anchors.topMargin: 30
        color: "white"
        smooth: true
        font.pixelSize: 26
        text: qsTr("Stereo")
    }

    Text {
        id: band
        anchors.left: effect.left
        anchors.top: effect.bottom
        anchors.topMargin: 30
        color: "white"
        smooth: true
        font.pixelSize: 46
        text: qsTr("FM")
    }

    Text {
        id: frequency
        anchors.left: band.left
        anchors.top: band.bottom
        anchors.topMargin: 30
        color: "white"
        smooth: true
        font.pixelSize: 88
        text: RadioInstance.someProperty()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(RadioInstance.doSomething())
            console.log("RadioPage mouseArea", radioPage.x, radioPage.y, radioPage.width, radioPage.height)
        }
    }

    onVisibleChanged: {
        if (visible) {
            showAnimation.start()
        }
    }

    Component.onCompleted: {
        createRadioListView()
        createToolbar()
//        RadioInstance.somePropertyChanged.connect(onSomePropertyChanged)
    }

    function createToolbar() {
        if (null === toolbar) {
            var component = Qt.createComponent("qrc:/Qmls/Qmls/Toolbar.qml")
            if (Component.Ready === component.status) {
                toolbar = component.createObject(radioPage)
                if (null != toolbar) {
                    toolbar.x = 0
                    toolbar.y = 480 - 65 - 75
                    toolbar.firstButtonNormalSource = "qrc:/Images/Images/Radio/btn_radio_switch_n.png"
                    toolbar.firstButtonPressedSource = "qrc:/Images/Images/Radio/btn_radio_switch_p.png"
                    toolbar.secondButtonNormalSource = "qrc:/Images/Images/Radio/btn_auto_search_n.png"
                    toolbar.secondButtonPressedSource = "qrc:/Images/Images/Radio/btn_auto_search_p.png"
                    toolbar.thirdButtonNormalSource = "qrc:/Images/Images/Radio/btn_prev_n.png"
                    toolbar.thirdButtonPressedSource = "qrc:/Images/Images/Radio/btn_prev_p.png"
                    toolbar.fourButtonNormalSource = "qrc:/Images/Images/Radio/btn_next_n.png"
                    toolbar.fourButtonPressedSource = "qrc:/Images/Images/Radio/btn_next_p.png"
                    toolbar.fiveButtonNormalSource = "qrc:/Images/Images/Radio/btn_manual_search_n.png"
                    toolbar.fiveButtonPressedSource = "qrc:/Images/Images/Radio/btn_manual_search_p.png"
                    toolbar.toolbarButtonReleased.connect(onToolbarButtonReleased)
                }
            }
        }
        console.log("toolbar", toolbar)
    }

    function createRadioListView() {
        if (null === radioListView) {
        var component = Qt.createComponent("qrc:/Qmls/Qmls/RadioListView.qml")
            if (Component.Ready === component.status) {
                radioListView = component.createObject(radioPage)
                if (null !== radioListView) {
                    console.log("10071", radioListView.x, radioListView.y, radioListView.width, radioListView.height)
                }
            }
        }
    }

    function onSomePropertyChanged(index) {
        if (visible) {
            console.log("onSomePropertyChanged", index)
        }
    }

    function onToolbarButtonReleased(index) {
        console.log("onToolbarButtonReleased", index)
        setToolbarButtonPressed(index)
    }

    function setToolbarButtonPressed(index) {
        toolbar.setButtonPressed(index)
    }
}
