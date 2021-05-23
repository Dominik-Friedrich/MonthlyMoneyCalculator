import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12

Window {
    id: mainWindow
    property variant win;

    width: 490
    height: 620
    minimumHeight: 620
    maximumHeight: 620
    minimumWidth: 490
    maximumWidth: 490

    visible: true
    title: qsTr("Monthly Money Calculator")

    function addItem(newElement) {
        listView.model.insert(listModel.count - 1, newElement)
    }

    function removeItems() {
        console.log("Count before remove: " + listModel.count)
        for (var i = 0; i < listModel.count; i++)
        {
            listView.model.get(i).getChecked()
            if (object.getChecked())
            {
                listModel.remove(i);
            }
        }
        console.log("Count after remove: " + listModel.count)
    }

    Pane {
        anchors.fill: parent

        ListModel {
            id: listModel
            ListElement { amount: "200"; description: "Moneten" }
            ListElement { amount: "4.99"; description: "Spotify" }
            ListElement { amount: "25"; description: "ggggggggggggggggggggggggggggggggggggify" }
        }

        PrettyComponent {
            id: listElement
        }

        ListView {
            id: listView
            anchors.fill: parent
            model: listModel
            delegate: listElement
        }



        // Add Button
        PrettyButton {
            anchors.bottom: parent.bottom
            anchors.left: parent.left

            text: qsTr("Add")

            onClicked: popup.open()
        }

        AddItemWindow {
            id: popup
        }

        // Remove Button
        PrettyButton {
            anchors.bottom: parent.bottom
            anchors.right: parent.right


            text: qsTr("Remove")

            onClicked: removeItems()
        }

    }
}
