import QtQuick
import QtQuick.Controls
import MyBattery 1.0

Window {
    id: batteryWidget
    width: 640
    height: 480
    visible: true
    title: qsTr("Battery")
    property int batteryValue: 0

    Battery {
        id: batteryInfo
        onIncrease: {
            batteryAnimationUp.to = batteryInfo.batteryCharge
            fillRectangle.color = batteryInfo.color
        }
        onDecrease: {
            batteryAnimationDown.to = batteryInfo.batteryCharge
            fillRectangle.color = batteryInfo.color
        }
    }

    function progressBarFill(event) {
        if (event.key === Qt.Key_Q) {
            batteryInfo.increased(fillRectangle.height)
            batteryAnimationUp.start()
        }
        else if(event.key === Qt.Key_W){
            batteryInfo.decreased(fillRectangle.height)
            batteryAnimationDown.start()
        }
    }

    PropertyAnimation {
        id: batteryAnimationUp
        target: batteryWidget
        property: "batteryValue"
        duration: 250
    }

    PropertyAnimation {
        id: batteryAnimationDown
        target: batteryWidget
        property: "batteryValue"
        duration: 250
    }

    Rectangle {
        id: fillRectangle
        focus: true
        anchors.bottom: rectangleBorder.bottom
        anchors.left: rectangleBorder.left
        width: rectangleBorder.width
        height: batteryValue

        Keys.onPressed: (event)=> {
                            progressBarFill(event)
                        }
    }

    Rectangle {
        id: rectangleBorder
        width: 50
        height: 200
        color: "transparent"
        anchors.centerIn: parent
        border.color: "black"
        border.width: 5
    }

    Rectangle {
        anchors.bottom: rectangleBorder.top
        anchors.horizontalCenter: rectangleBorder.horizontalCenter
        color: "black"
        width: 10
        height: 5
    }

    Component.onCompleted: {
        batteryInfo.seedValueSetted(rectangleBorder.height / 20, rectangleBorder.height)
    }
}
