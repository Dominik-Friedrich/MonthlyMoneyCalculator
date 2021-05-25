import QtQuick 2.12
import QtQuick.Controls 2.15

Popup {
    id:addItemWindow

    width: 480
    height: 200
    x: (parent.width - width) / 2
    y: (parent.height - height) / 3
    modal: true
    focus: true
    onClosed: resetValues()
    closePolicy: Popup.CloseOnEscape

    function addItem()
    {
        var factor = 1

        switch(cycle.currentIndex) {
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
        if (!(amount.text === ""))
        {
            _amount = parseDouble(amount.text) * factor
        }
        _amount = Math.round(_amount * 100) / 100

        mainWindow.addItem({"amount": _amount.toString(), "description": description.text})
        addItemWindow.close()
    }

    function resetValues()
    {
        // Reset values for next popup call
        amount.text = ""
        amount.focus = true
        cycle.currentIndex = 0
        description.text = ""
    }

    Row {
        Keys.onReturnPressed: addItemWindow.addItem()
        width: parent.width
        spacing: 20
        topPadding: parent.height / 3
        leftPadding: 10
        rightPadding: 10

        TextField {
            id: amount
            width: 110
            focus: true
            placeholderText: qsTr("Amount...")
            validator: RegExpValidator { regExp: /(?:(?!\d)[-])?\d+(\,|\.)\d{0,2}/ }
        }

        ComboBox {
            id: cycle
            width: 150
            model: [ qsTr("Monthly"), qsTr("Daily"), qsTr("Quartaly"), qsTr("Bi-yearly"), qsTr("Yearly") ]
        }

        TextField {
            id: description
            width: 150
            placeholderText: qsTr("Description...")
        }
    }

    // Add Button
    PrettyButton {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 150

        text: qsTr("Add")

        onClicked: addItemWindow.addItem()
    }

    // Remove Button
    PrettyButton {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 150

        text: qsTr("Cancel")

        onClicked: {
            addItemWindow.close()
        }
    }
}
