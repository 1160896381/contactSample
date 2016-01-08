import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.4
import "./js/nsite.proxy.js" as NSite

GridView {
    y: 30
    height: 600
    width: 600

    delegate: Column {
        Image {
            id: img
            source: portrait
            anchors.horizontalCenter: parent.horizontalCenter
            // 点击弹出信息
            MouseArea{
                anchors.fill: img
                onClicked: {
                    popup.reset();
                    popup.visible = true;
                    console.log(department)
                }
            }
        }
        Text {
            text: name
            color: "#999993"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    // 弹出层
    Popup {
        id: popup
        width: 200; height: 300
        x: 200; y:100
        visible: false;
        radius: 5

        Text{
            text: 'this is popup'
            color: "#999999"
            anchors.bottom: parent.bottom
            anchors.centerIn: parent
        }
        Button {
            id: btnMsg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            width: 98
            style: ButtonStyle {
                label: Text {
                    x: 25
                    text:"发消息"
                    color: "#FFFFFF"
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    radius: 4
                    color: "#5FB760"
                }
            }
            onClicked: {
                parent.visible = false;
            }
        }
    }
}
