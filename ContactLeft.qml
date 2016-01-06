import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import "./js/nsite.proxy.js" as NSite

Item {
    id: _contact
    ListModel {
        id: modelTree
        Component.onCompleted: {
            modelTree.append(NSite.contact);
        }
    }

    function showContent() {
        var component = Qt.createComponent("Content.qml");

        if (component.status === Component.Ready) {
            var ContentQml = component.createObject(m_contentLoader,
                                              {});
            ContentQml.xClicked.connect(doSomething);     // 实现两个qml组件之间的通信
        }
    }

    function doSomething(msg) {
        console.log(msg);
    }

    TreeView {
        anchors.fill: parent
        id: tree
        model: modelTree
        onSelectedItemChanged: {
            showContent()
        }

        rowHeight: 30
        expanderImage: "./images/trigle.png"
    }
}

