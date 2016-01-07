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

    ListModel {
        id: modelGrid
        Component.onCompleted: {
            modelGrid.append(NSite.content);
        }
    }

    function showContent(item) {
        var title = Qt.createComponent("ContentTitle.qml");
        var content = Qt.createComponent("Content.qml");

        if (content.status === Component.Ready) {
            var ContentTitleQml = title.createObject(m_contentLoader,
                                                     {
                                                         text: item,
                                                         x: (m_contentLoader.width - width)/2 + m_contactLoader.width
                                                     });
            var ContentQml = content.createObject(m_contentLoader,
                                                  {
                                                      x: m_contactLoader.width + 20,
                                                      model: modelGrid
                                                  });
            ContentTitleQml.destroy(2000)
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
            showContent(item)
        }
        rowHeight: 30
        expanderImage: "./images/trigle.png"
    }
}

