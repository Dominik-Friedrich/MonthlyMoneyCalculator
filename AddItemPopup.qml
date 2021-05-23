import QtQuick 2.12
import QtQuick.Controls 2.15
import com.myself 1.0

Popup {
    id:addItemWindow

    width: 480
    height: 200
    x: (parent.width - width) / 2
    y: (parent.height - height) / 3
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape

    Row {
        width: parent.width
        spacing: 20
        topPadding: parent.height / 3
        leftPadding: 10
        rightPadding: 10

        TextField {
            id: amount
            width: 110
            placeholderText: qsTr("Enter amount")
            validator: RegExpValidator { regExp: /(?:(?!\d)[+|-])?\d+/ }
        }

        ComboBox {
            id: cycle
            width: 150
            model: [ qsTr("Monthly"), qsTr("Daily"), qsTr("Quartaly"), qsTr("Bi-yearly"), qsTr("Yearly") ]
        }

        TextField {
            id: description
            width: 150
            placeholderText: qsTr("Enter description")
        }
    }

    // Add Button
    PrettyButton {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 150

        text: qsTr("Add")

        onClicked: {
            // register item to cpp
            console.log(myobject.addNewItem(amount.text, cycle.currentIndex, description.text))
            mainWindow.addItem({"amount": amount.text, "description": description.text})

            // Reset values for next popup call
            amount.text = ""
            cycle.currentIndex = 0
            description.text = ""
            addItemWindow.close()
        }
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

    MyObject {
        id: myobject
    }
}
