import QtQuick 2.0

Item {
    id: contactDelegate
    height: 80

    function myDelegate() {
        return nameDelegate;
    }

    Component {
        id: typeDelegate
        Rectangle {
            width: parent.width
            height: childrenRect.height
            color: "#D0D0D0"
            Column {
                Text {
                    x: 5
                    text: type
                    font.bold: true
                    color: "#616161"
                    font.pixelSize: 15
                }
            }
        }
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
                        source: icon
                        sourceSize.width: 30
                        sourceSize.height: 30
                        y: (parent.height - height) / 2
                    }
                    Text {
                        text: name
                        font.pixelSize: 12
                        y: (parent.height - height) / 2
                    }
                }
            }
        }
    }

    Loader {
        id: itemDisplay
        anchors.fill: parent
        sourceComponent: myDelegate()
    }
}
