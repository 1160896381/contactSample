import QtQuick 2.0
import "./js/nsite.proxy.js" as NSite

GridView {
    id: _content
    y: 30
    height: 600
    width: 600

    signal xClicked(string msg)

    delegate: Column {
        Image {
            source: portrait;
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: name;
            color: "#999993"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            _content.xClicked("test")
            _content.destroy()
        }
    }
}
