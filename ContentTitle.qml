import QtQuick 2.0

Text {
    id: _title
    width: 600
    height: 20
    color: "#FFFFFF"

    MouseArea{
        anchors.fill: parent
        onClicked: {
            _title.destroy()
        }
    }
}


