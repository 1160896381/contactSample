import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    Component {
        id: groupDelegate
        Rectangle {
            id: group
            width: parent.width
            height: childrenRect.height
            color: "#D0D0D0"
            Column {
                Text {
                    x: 5
                    text: section
                    font.bold: true
                    color: "#616161"
                    font.pixelSize: 15
                }
            }
        }
    }

    ListView {
        id: contactView
        anchors.fill: parent
        model: ContactBank {}
        delegate: NameDelegate {}

        section.property: "group"
        section.criteria: ViewSection.FullString
        section.delegate: groupDelegate
    }
}

