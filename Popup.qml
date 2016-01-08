import QtQuick 2.0

Rectangle {
    id: root
    width: 100
    height: 200
    color: '#D3D3D3'
    z:100

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
        save();
    }

    //------------------------------
    // 辅助方法
    //------------------------------
    function getRoot(item)
    {
        return (item.parent !== null) ? getRoot(item.parent) : item;
    }

    function save()
    {
        innerX = root.x;
        innerY = root.y;
        innerWidth = root.width;
        innerHeight = root.height;
        innerOpacity = root.opacity;
    }

    function reset()
    {
        root.x = innerX;
        root.y = innerY;
        root.width = innerWidth
        root.height = innerHeight;
        root.opacity = innerOpacity;
        root.scale = 1;

        root.visible = true;
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
}
