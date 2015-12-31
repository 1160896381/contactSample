import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    ListView {
        id: contactView
        anchors.fill: parent
        model: ContactBank {}
        delegate: NameDelegate {}
        section {
            property: "group"
            delegate: GroupDelegate {}
        }
    }
}

