import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {    
    width: 200
    height: 600

    ListView {
        id: contactView
        anchors.top: parent.top
        width: parent.width
        model: ContactBank {}
        delegate: ContactDelegate {}
    }
}

