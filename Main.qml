import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import "./js/nsite.proxy.js" as NSite

ApplicationWindow {
    id: window
    width: 800
    height: 600
    title: qsTr("联系人")
    color: "#424242"

    SplitView {
        anchors.fill: parent
        ContactLeft {
            id: m_contactLoader
            width: 200
        }
        ContactRight {
            id: m_contentLoader
            anchors.fill: parent
            Layout.fillWidth: true
        }
    }
}
