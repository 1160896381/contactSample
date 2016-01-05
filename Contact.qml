import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import "./js/nsite.proxy.js" as NSite

Item {
    ListModel {
        id: modelTree
        Component.onCompleted: {
            modelTree.append(NSite.contact);
        }
    }

    TreeView {
        anchors.fill: parent
        id: tree
        model: modelTree
//        onSelectedItemChanged: console.log(item.pic)

        rowHeight: 30
        expanderImage: "./images/trigle.png"
    }
}

