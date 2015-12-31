import QtQuick 2.0

Item {
    height: 50

    function myDelegate() {
        return nameDelegate
    }

    Component {
        id: nameDelegate
        Rectangle {
            width: 200
            height: 50
            Column {
                Row {
                    x: 5
                    height: 50
                    spacing: 5
                    Image {
                        id: img
                        source: icon
                        sourceSize.width: 30
                        sourceSize.height: 30
                        y: (parent.height - height) / 2
                    }
                    Text {
                        id: txt
                        text: value
                        font.pixelSize: 12
                        y: (parent.height - height) / 2
                    }
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
