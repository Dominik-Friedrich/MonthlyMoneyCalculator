import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12

Window {
    id: mainWindow
    property double monthlyAllowance: 0

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
        for (var i = listView.count - 1; i >= 0; i--)
        {
            if (listView.itemAt(i).isChecked)
            {
                listModel.remove(i)
            }
        }
    }

    AddItemPopup {
        id: popup
    }

    Column {
        anchors.fill: parent

        Pane {
            width: parent.width
            height: parent.height - buttonPane.height

            ListModel {
                id: listModel
                ListElement { amount: "200"; description: "Moneten"}
                ListElement { amount: "4.99"; description: "Spotify" }
                ListElement { amount: "25"; description: "ggggggggggggggggggggggggggggggggggggify" }
                ListElement { amount: "200"; description: "Moneten" }
                ListElement { amount: "4.99"; description: "Spotify" }
                ListElement { amount: "25"; description: "1" }
                ListElement { amount: "25"; description: "2" }
                ListElement { amount: "25"; description: "3" }
                ListElement { amount: "25"; description: "4" }
                ListElement { amount: "25"; description: "5" }
                ListElement { amount: "25"; description: "6" }
                ListElement { amount: "25"; description: "7" }
                ListElement { amount: "25"; description: "8" }
                ListElement { amount: "25"; description: "9" }
                ListElement { amount: "25"; description: "10" }
            }

            PrettyComponent {
                id: listElement
            }

            Flickable {
                anchors.fill: parent
                flickableDirection: Flickable.VerticalFlick
                boundsBehavior: Flickable.StopAtBounds
                contentHeight: repeaterColumn.implicitHeight
                contentWidth: repeaterColumn.width
                clip: true

                Column {
                    id: repeaterColumn
                    anchors.fill: parent

                    Repeater {
                        id: listView
                        model: listModel
                        delegate: listElement
                    }
                }
            }
        }

        Pane {
            id: buttonPane
            width: parent.width

            Row {
                width: parent.width
                spacing: (width - addButton.width - addButton.width) / 3
                leftPadding: spacing
                rightPadding: spacing

                // Add Button
                PrettyButton {
                    id: addButton
                    anchors.verticalCenter: parent.verticalCenter

                    text: qsTr("Add")

                    onClicked: popup.open()
                }

                // Remove Button
                PrettyButton {
                    id: removeButton
                    anchors.verticalCenter: parent.verticalCenter

                    text: qsTr("Remove")

                    onClicked: removeItems()
                }
            }
        }
    }
}
