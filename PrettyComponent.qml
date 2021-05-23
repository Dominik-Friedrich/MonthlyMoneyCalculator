import QtQuick 2.12
import QtQuick.Controls 2.12

Component {
    Column {
        width: mainWindow.width
        property bool isLast: index + 1 < listView.count ? false : true

        Row {
            width: parent.width
            leftPadding: 25
            rightPadding: 25

            Rectangle {
                width: parent.width - parent.leftPadding - parent.rightPadding - removeCheckBox.width
                height: 1
                visible: (isLast) ? true : false
                color: "white"
                opacity: 0.77
            }
        }

        Row {
            width: parent.width
            height: 40
            spacing: 10
            leftPadding: 25
            rightPadding: 25



            PrettyText {
                id: amountText
                property bool negative: (convertToNumber(amount) < 0) ? true : false
                color: (negative) ? "red" : "green"
                text: (negative) ? amount : "+"+amount
                width: 80

                function convertToNumber(string)
                {
                    return parseInt(string)
                }
            }

            PrettyText {
                id: descriptionText
                width: parent.width - amountText.width - 2 * parent.spacing - removeCheckBox.width - parent.leftPadding - parent.rightPadding
                text: description
            }

            CheckBox {
                id: removeCheckBox
                visible: (isLast) ? false : true

                onCheckedChanged: {

                }
            }
        }
    }
}
