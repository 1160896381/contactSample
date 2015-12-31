import QtQuick 2.0

Item {
    height: 20

    function myDelegate() {
        return groupDelegate
    }

    Component {
        id: groupDelegate
        Rectangle {
            color: "#D0D0D0"
            Text {
                x: 5
                text: section
                font.bold: true
                color: "#616161"
                font.pixelSize: 15
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log('color')
                }
            }
        }
    }

    Loader {
        id: itemDisplay
        anchors.fill: parent;
        sourceComponent: myDelegate()
    }
}
