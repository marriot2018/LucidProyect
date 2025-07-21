import QtQuick
import QtQuick.Controls
import MyBattery 1.0

Item {
    id: batteryWidget
    width: 640
    height: 480
    property int batteryValue: 0
    property alias animationDuration: batteryAnimationUp.duration

    Battery {
        id: batteryInfo
        onBatteryPercentageChange: {
            batteryAnimationUp.to = Math.round(rectangleBorder.height * batteryPercentage)
            //fillRectangle.color = batteryInfo.color
            batteryAnimationUp.start()
        }
    }

    function progressBarFill(event) {
        if (event.key === Qt.Key_Q) {
            batteryInfo.setBatteryPercentage(true)
        }
        else if(event.key === Qt.Key_W){
            batteryInfo.setBatteryPercentage(false)
        }
    }

    PropertyAnimation {
        id: batteryAnimationUp
        target: batteryWidget
        property: "batteryValue"
    }

    Rectangle {
        id: fillRectangle
        focus: true
        color: batteryInfo.color
        anchors {
            bottom: rectangleBorder.bottom
            left: rectangleBorder.left
        }
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
        anchors {
            bottom: rectangleBorder.top
            horizontalCenter: rectangleBorder.horizontalCenter
        }
        color: "black"
        width: 10
        height: 5
    }
}
