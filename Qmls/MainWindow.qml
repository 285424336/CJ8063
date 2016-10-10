import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: mainWindow
    color: "transparent"
    visible: true
    width: 800
    height: 480

    property Tabview tabview: null
    property HomePage homePage: null
    property RadioPage radioPage: null
    property var __showPage: null

    Image {
        id: background
        source: "qrc:/Images/Images/Common/backgroud.png"
    }


    SequentialAnimation {
        id: showAnimation
        running: false
        NumberAnimation {
            target: mainWindow
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 250
        }
    }

    onVisibleChanged: {
        if (visible) {
            showAnimation.start()
        }
    }

    Component.onCompleted: {
        createHomePage()
        createRadioPage()
        createTabview()
        state = "homePage"
    }

    states: [
        State {
            name: "homePage"
        },
        State {
            name: "radioPage"
        }
    ]

    onStateChanged: {
        console.log("onStateChanged", state)
        switch (state) {
        case "homePage": {
            radioPage.visible = false
            tabview.visible = false
            homePage.visible = true
            break;
        }
        case "radioPage": {
            homePage.visible = false
            tabview.currentPage = 1
            tabview.visible = true
            radioPage.visible = true
            break;
        }
        default : {
            break;
        }
        }
    }

    function createTabview() {
        if (null === tabview) {
            var component = Qt.createComponent("qrc:/Qmls/Qmls/Tabview.qml")
            if (Component.Ready === component.status) {
                tabview = component.createObject(mainWindow)
                if (null != tabview) {
                    tabview.x = 0
                    tabview.y = 0
                    tabview.visible = false
                    tabview.buttonReleased.connect(tabviewButtonReleased)
                }
            }
        }
    }

    function createHomePage() {
        if (null === homePage) {
            var component = Qt.createComponent("qrc:/Qmls/Qmls/HomePage.qml")
            if (Component.Ready === component.status) {
                homePage = component.createObject(mainWindow)
                if (null != homePage) {
                    homePage.x = 0
                    homePage.y = 0
                    homePage.visible = false
                    homePage.homeButtonReleased.connect(buttonReleased)
                }
            }
        }
        console.log("1homePage", homePage)
    }

    function createRadioPage() {
        if (null === radioPage) {
            var component = Qt.createComponent("qrc:/Qmls/Qmls/RadioPage.qml")
            if (Component.Ready === component.status) {
                radioPage = component.createObject(mainWindow)
                if (null != radioPage) {
                    radioPage.x = 0
                    radioPage.y = 65
                    radioPage.visible = false
                }
            }
        }
    }

    function tabviewButtonReleased(index) {
        console.log("tabviewButtonReleased", index)
        switch (index) {
        case 0: {
            state = "homePage"
            break;
        }
        case 1: {
            state = "radioPage"
            break;
        }
        }
    }

    function buttonReleased(index) {
        switch (index) {
        case 0: {
            state = "radioPage"
            break;
        }
        case 1: {
            console.log("usbPage", index)
            break;
        }
        case 2: {
            console.log("bluetoothPage", index)
            break;
        }
        case 3: {
            console.log("ipodPage", index)
            break;
        }
        case 4: {
            console.log("carplayPage", index)
            break;
        }
        case 5: {
            console.log("carlifePage", index)
            break;
        }
        case 6: {
            console.log("phonePage", index)
            break;
        }
        case 7: {
            console.log("voicePage", index)
            break;
        }
        case 8: {
            console.log("settingPage", index)
            break;
        }
        default : {
            break;
        }
        }
    }
}
