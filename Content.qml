import QtQuick 2.0
import "./js/nsite.proxy.js" as NSite

Rectangle {
    id: _content
    height: 600
    width: 600
    anchors.right: m_contentLoader.right

    signal xClicked(string msg)

    GridView {
        anchors.fill: parent
        model: ContactModel {}
        delegate: Column {
            Image { source: portrait; anchors.horizontalCenter: parent.horizontalCenter }
            Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
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
