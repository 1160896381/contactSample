import QtQuick 2.0
import "./js/nsite.proxy.js" as NSite

GridView {
    id: grid
    y: 30
    height: 600
    width: 600

    property variant popValue: QtObject {
        property string name
        property string department
        property string title
        property string tel
    }
    property real popX
    property real popY

    delegate: Column {
        id: _col
        Image {
            id: img
            source: portrait
            anchors.horizontalCenter: parent.horizontalCenter

            // 点击弹出信息
            MouseArea{
                anchors.fill: img
                onClicked: {
                    // 这里需要grid的鼠标位置
                    popX = mouseX + _col.x
                    popY = mouseY + _col.y
                    popup.visible = true;
                    popValue = {
                        name: name,
                        department: department,
                        title: title,
                        tel: tel
                    }
                }
            }
        }
        Text {
            text: name
            color: "#999999"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    // 弹出层
    Popup {
        id: popup
        width: 170; height: 200
        visible: false;
        radius: 5
        x: popX
        y: popY

        Text{
            text: "    <br>姓名：" + popValue.name         +
                  "<br><br>部门：" + popValue.department   +
                  "<br><br>职务：" + popValue.title        +
                  "<br><br>电话：" + popValue.tel
            color: "#999999"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
