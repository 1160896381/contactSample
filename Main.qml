import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Rectangle {
    width: 800
    height: 600

    SplitView {
        anchors.fill: parent
        ListLeft {
            width: 200
        }
        ContentRight {
            Layout.fillWidth: true
        }
    }
}

