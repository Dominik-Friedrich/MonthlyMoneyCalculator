import QtQuick 2.12
import QtQuick.Controls 2.15

Popup {
    id:editItemWindow

    width: 480
    height: 200
    x: (parent.width - width) / 2
    y: (parent.height - height) / 3
    modal: true
    focus: true
    property int currentItemIndex: 0
    closePolicy: Popup.CloseOnEscape

    function editItemWindow(text, description, index)
    {
        edit_amount.text = text
        edit_description.text = description
        currentItemIndex = index
        open()
    }

    function addItem()
    {
        var factor = 1

        switch(edit_cycle.currentIndex) {
        case 0:
            // monthly
            break;

        case 1:
            // daily
            // average days used is 30
            factor = 30
            break;

        case 2:
            // quartaly
            factor = 1/4
            break;

        case 3:
            // twice a year
            factor = 1/6
            break;

        case 4:
            // once a year
            factor = 1/12
            break;
        }

        // Empty string should be interpreted as "0"
        var _amount = "0"
        if (!(edit_amount.text === ""))
        {
            _amount = parseDouble(edit_amount.text) * factor
        }
        _amount = Math.round(_amount * 100) / 100

        mainWindow.removeItem(currentItemIndex)
        mainWindow.addItem({"amount": _amount.toString(), "description": edit_description.text}, currentItemIndex)
        editItemWindow.close()
    }

    Row {
        Keys.onReturnPressed: editItemWindow.editItem()
        width: parent.width
        spacing: 20
        topPadding: parent.height / 3
        leftPadding: 10
        rightPadding: 10

        TextField {
            id: edit_amount
            width: 110
            focus: true
            placeholderText: qsTr("Amount...")
            validator: RegExpValidator { regExp: /(?:(?!\d)[-])?\d+(\,|\.)\d{0,2}/ }
        }

        ComboBox {
            id: edit_cycle
            width: 150
            model: [ qsTr("Monthly"), qsTr("Daily"), qsTr("Quartaly"), qsTr("Bi-yearly"), qsTr("Yearly") ]
        }

        TextField {
            id: edit_description
            width: 150
            placeholderText: qsTr("Description...")
        }
    }

    Row {
        width: parent.width
        spacing: (width - editButtonAdd.width - editButtonRemove.width - editButtonAdd.width) / 4
        leftPadding: spacing
        rightPadding: spacing
        anchors.bottom: parent.bottom

        // Add Button
        PrettyButton {
            id: editButtonAdd
            width: 130

            text: qsTr("Edit")

            onClicked: editItemWindow.addItem()
        }

        // Remove Button
        PrettyButton {
            id: editButtonRemove
            width: 130

            text: qsTr("Remove")

            onClicked: {
                mainWindow.removeItem(currentItemIndex)
                editItemWindow.close()
            }
        }

        // Cancel Button
        PrettyButton {
            id: editButtonCancel
            width: 130

            text: qsTr("Cancel")

            onClicked: {
                editItemWindow.close()
            }
        }
    }
}
