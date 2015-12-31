import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Rectangle {
    width: 800
    height: 600

    SplitView {
        anchors.fill: parent
        // left
        Rectangle {
            Layout.minimumWidth: 60
            width: 200

            List {}
        }
        // right
        Rectangle {
            Layout.fillWidth: true

            Content {}
        }
    }
}

