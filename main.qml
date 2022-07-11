import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import Calculator 1.0
Window {
    id: root
    width: 450
    height: 480
    visible: true
    title: qsTr("Hello World")
    property string display_value : ""
    property int value1 : 0
    property int value2 : 0
    property bool operation_numPress : false
    property bool operation_addPress : false
    GridLayout	{
        id: grid
        columns: 3
        columnSpacing: 5
        anchors.top: background.bottom
        anchors.topMargin: 40
        property int size : parent.height/6
        Button {
            id : number9
            text: "9"
            Layout.preferredHeight: grid.size
            property string value : "9"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number8
            text : "8"
            Layout.preferredHeight: grid.size
            property string value : "8"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number7
            text : "7"
            Layout.preferredHeight: grid.size
            property string value : "7"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number6
            text : "6"
            Layout.preferredHeight: grid.size
            property string value : "6"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number5
            text : "5"
            Layout.preferredHeight: grid.size
            property string value : "5"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number4
            text : "4"
            Layout.preferredHeight: grid.size
            property string value : "4"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number3
            text : "3"
            Layout.preferredHeight: grid.size
            property string value : "3"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number2
            text : "2"
            Layout.preferredHeight: grid.size
            property string value : "2"
            onClicked: {
                display_value += value
            }
        }
        Button {
            id : number1
            text : "1"
            Layout.preferredHeight: grid.size
            property string value : "1"
            onClicked: {
                display_value += value
            }
        }
    }
        Button {
            id : number0
            text : "0"
            anchors.top : grid.bottom
            anchors.horizontalCenter: grid.horizontalCenter             //Didn't know how to implement this Button inside grid
            anchors.topMargin : 5
            height: grid.size
            property string value : "0"
                onClicked: {
                     display_value += value
                    }
                }
        TextEdit {
            id : display
            color : "black"
            font.pointSize: 20
            text : display_value
            font.family: "Ubuntu"
            anchors.right: background.right
            anchors.rightMargin: 15
            height: parent.height/6
            width: background.width-30
            horizontalAlignment :display.AlignLeft
            verticalAlignment: TextEdit.AlignVCenter
        }
        Rectangle {
            id: background
            width: root.width/1.3
            height: display.height/1.3
            anchors.verticalCenter: display.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "grey"
            z:-1
        }
        Button {
            id: add_button
            anchors.left : grid.right
            anchors.leftMargin: 15
            anchors.top: background.bottom
            anchors.topMargin: 40
            text: "+"
            height: grid.size
            onClicked: {
                value1 = display_value
                display_value = display_value + "+"
                operation_numPress = true
                operation_addPress = true
                //console.log("true")
            }
        }
        Calculator {
            id: calculator
        }

        Button {
            id: equal_button
            anchors.left : add_button.right
            anchors.top: add_button.top
            text: "="
            height: grid.size
            onClicked: {
                    if(display_value == "") {
                        operation_numPress : false
                        display_value = 0
                    }
                    if(!root.operation_numPress) {
                        display_value = display_value
                        root.operation_numPress = false

                    }
                    else if(root.operation_addPress){
                        root.display_value = calculator.addOperation(display_value)
                        root.operation_numPress = false
                        root.operation_addPress = false
                    }
            }
        }
} 
