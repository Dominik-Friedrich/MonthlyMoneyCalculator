import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0

ApplicationWindow {
    id: mainWindow
    width: 490
    height: 620
    minimumHeight: 620
    maximumHeight: 620
    minimumWidth: 490
    maximumWidth: 490
    visible: true

    title: qsTr("Monthly Money Calculator")

    property double monthlyAllowance: 0
    property string datastore: ""
    property string language: "en"
    onLanguageChanged: translationHandler.selectLanguage(mainWindow.language)

    Component.onCompleted: {
        if (datastore) {
            listModel.clear()
            var datamodel = JSON.parse(datastore)
            for (var i = 0; i < datamodel.length; ++i) {
                listModel.append(datamodel[i])
            }
        }
    }

    onClosing: {
        var datamodel = []
        for (var i = 0; i < listModel.count; ++i) {
            datamodel.push(listModel.get(i))
            datastore = JSON.stringify(datamodel)
        }
    }

    function addItem(newElement) {
        listView.model.insert(listModel.count - 1, newElement)

        addMonthlyAllowance(parseDouble(newElement.amount))
    }

    function removeItems() {
        for (var i = listView.count - 1; i >= 0; i--)
        {
            if (listView.itemAt(i).isChecked)
            {
                subMonthlyAllowance(parseDouble(listView.itemAt(i).sAmount))
                listModel.remove(i)
            }
        }
    }

    function addMonthlyAllowance(val)
    {
        monthlyAllowance += val
        monthlyAllowance = Math.round(monthlyAllowance * 100) / 100;
        listModel.setProperty(listModel.count - 1, "amount", ""+monthlyAllowance)
    }

    function subMonthlyAllowance(val)
    {
        monthlyAllowance -= val
        monthlyAllowance = Math.round(monthlyAllowance * 100) / 100;
        listModel.setProperty(listModel.count - 1, "amount", ""+monthlyAllowance)
    }

    function parseDouble(string)
    {
        return parseFloat(string);
    }

    function reset()
    {
        monthlyAllowance = 0
        for (var i = listView.count - 2; i >= 0; i--)
        {
            listModel.remove(i)
        }
    }

    Settings {
        id: settings
        //property alias language:
        property alias x: mainWindow.x
        property alias y: mainWindow.y
        property alias monthlyAllowance: mainWindow.monthlyAllowance
        property alias datastore: mainWindow.datastore
        property alias language: mainWindow.language
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            Menu {
                title: qsTr("Language")
                MenuItem {
                    text: qsTr("German")
                    onClicked: {
                        mainWindow.language = "de"
                    }
                }
                MenuItem {
                    text: qsTr("English")
                    onClicked: {
                        mainWindow.language = "en"
                    }
                }
            }
            MenuItem {
                text: qsTr("Reset")
                onClicked: mainWindow.reset()
            }
            MenuItem {
                text: qsTr("Close")
                onClicked: mainWindow.close()
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
                ListElement { amount: "0"; description: qsTr("Monthly Allowance") }
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
