import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Cluster")

    BatteryWidget {
        anchors.centerIn: parent
        animationDuration: 250
    }
}
