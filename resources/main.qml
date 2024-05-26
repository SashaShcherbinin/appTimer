import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Timer Example"

    property int timerValue: 0

    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0; color: "#c85151" }
            GradientStop { position: 1; color: "#2f1fc1" }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20
        Row {
            spacing: 20
            Text {
                id: timerTextLabel
                text: "Timer:"
                font.pixelSize: 30
                font.bold: true
                color: "white"
            }
            Text {
                id: timerTextValue
                text: timerValue
                font.pixelSize: 30
                font.bold: true
                color: "white"
            }
        }

        Button {
            id: timerButton
            text: "Start Timer"
            font.pixelSize: 20
            width: 200
            height: 50

            contentItem: Text {
                text: timerButton.text
                color: "#fdfcfc" // Change this to your desired color
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: timerButton.font
            }

            background: Rectangle {
                color: "#808080"
                radius: 25
            }

            onClicked: {
                if (timer.running) {
                    timer.stop();
                    text = "Start Timer";
                    timerValue = 0;
                } else {
                    timer.start();
                    text = "Stop Timer";
                }
            }
        }
    }

    // Timer
    Timer {
        id: timer
        interval: 1000 // 1 second
        running: false
        repeat: true
        onTriggered: {
            timerValue += 1
        }
    }
}