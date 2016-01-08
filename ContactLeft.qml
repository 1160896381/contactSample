import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import "./js/nsite.proxy.js" as NSite

Rectangle {
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

    property var contentTitleQml
    property var contentQml
    property Component title: Qt.createComponent("ChildrenRightTitle.qml")
    property Component content: Qt.createComponent("ChildrenRightContent.qml")

    function showContent(item) {
        if (contentTitleQml)
            contentTitleQml.destroy()
        if (contentQml)
            contentQml.destroy()

        if (content.status === Component.Ready) {
            contentTitleQml = title.createObject(m_contentLoader,
                                                 {
                                                     text: item,
                                                     x: (m_contentLoader.width - width)/2 + m_contactLoader.width
                                                 });
            contentQml = content.createObject(m_contentLoader,
                                              {
                                                  x: m_contactLoader.width + 20,
                                                  model: modelGrid
                                              });
        }
    }

    TextInput {
        id: input
        text: "输入查找的联系人"
        width: 200; height: 20
        focus: true
    }

    TreeView {
        anchors.top: input.bottom
        anchors.bottom: parent.bottom
        id: tree
        model: modelTree
        onSelectedItemChanged: {
            showContent(item)
        }
        rowHeight: 30
        expanderImage: "./images/trigle.png"
    }
}

