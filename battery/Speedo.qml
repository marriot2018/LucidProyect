import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    id: speedoWindow
    width: 640
    height: 480
    visible: true

    Item {
        id: shape
        width: 400
        height: 200
        anchors.centerIn: background

        ConicalGradient {
            id: gradient
            anchors.fill: parent
            angle: -128
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.5; color: "transparent" }
                GradientStop { position: 0.75; color: "transparent" }
                GradientStop { position: 1.0; color: "yellow" }
            }
        }
    }

    Rectangle {
        id: background
        width: 420
        height: 420
        anchors.centerIn: parent
        color: "black"

        Image {
            id: fillMask
            width: 540
            height: 350
            y: -55
            rotation: 2
            anchors.horizontalCenter: background.horizontalCenter
            source: "qrc:/images/mask2.png"
        }

        OpacityMask {
            id: oMask
            anchors.fill: fillMask
            source: shape
            maskSource: fillMask
        }

        PropertyAnimation {
            id: gradientAnim
            target: gradient
            property: "angle"
            duration: 1000
        }

        Image {
            id: needle
            width: 599
            height: 599
            anchors.centerIn: parent
            source: "qrc:/images/needle_1.png"
            rotation: -95
        }

        PropertyAnimation {
            id: needleAnimation
            target: needle
            property: "rotation"
            duration: 1000
        }

        Item {
            anchors.fill: parent
            focus: true
            Keys.onPressed: (event) => {
                                if (event.key === Qt.Key_A) {
                                    needleAnimation.to = 95
                                    gradientAnim.to = 135
                                    needleAnimation.restart()
                                    gradientAnim.restart()
                                }
                            }
            Keys.onReleased: (event) => {
                                 if (event.key === Qt.Key_A) {
                                     needleAnimation.to = -95
                                     gradientAnim.to = -128
                                     needleAnimation.restart()
                                     gradientAnim.restart()
                                 }
                             }
        }
    }

}
