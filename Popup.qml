import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: root
    width: 100
    height: 200
    color: '#D3D3D3'
//    z: popZ

    // 私有属性
    property int innerX;
    property int innerY;
    property int innerWidth;
    property int innerHeight;
    property double innerOpacity;


    //------------------------------
    // 事件
    //------------------------------
    // 属性备份一下，避免动画对属性进行变更
    Component.onCompleted: {
//        save();
    }

    //------------------------------
    // 遮罩
    //------------------------------
    // 禁止事件穿透
    MouseArea{
        anchors.fill: parent;
        onPressed:{
             mouse.accepted = true
        }
        drag.target: root  // root可拖动
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
