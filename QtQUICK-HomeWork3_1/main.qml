import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Lesson 3")
    id: root
    color: "#e5ecef"
    property string login
    property string password
    Rectangle{
        id: second_Frame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 250
        state: ""
        Text{
            y: 200
            id: cant_register
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: "You have already registered"
            font.pixelSize: 15
        }
        Text{
            y: 10
            id: success
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: "Successful"
            font.pixelSize: 15
        }
        Column{
            anchors.fill: parent
            padding: 50
            spacing: 50


            Rectangle {
                id: login_btn
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40
                color: "#f6f6f6"
                Text{
                    color: "black"
                    font.pixelSize: 15
                    text: "Login"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.color = "#bbbbbb"
                    }
                    onReleased: {
                        parent.color = "#f6f6f6"
                    }
                    onEntered: {
                        parent.color = "#d6d6d6"
                    }
                    onExited: {
                        parent.color = "#f6f6f6"
                    }

                    onClicked: {
                        if(second_Frame.state === ""){
                            second_Frame.state = "login_state"
                            login_Frame.state = "login_state"
                        }
                    }
                }
            }
            Rectangle {
                id: register_btn
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40
                color: "#f6f6f6"
                Text{
                    color: "black"
                    font.pixelSize: 15
                    text: "Registration"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.color = "#bbbbbb"
                    }
                    onReleased: {
                        parent.color = "#f6f6f6"
                    }
                    onEntered: {
                        parent.color = "#d6d6d6"
                    }
                    onExited: {
                        parent.color = "#f6f6f6"
                    }

                    onClicked: {
                        if(register_Frame.state !== "registered"){
                            second_Frame.state = "register_state"
                            register_Frame.state = "register_state"
                        }else{
                            cant_reg_anim.start()
                        }}
                }
            }
        }
        states:[ State{
                name: "login_state"
                PropertyChanges{ target: second_Frame; opacity: 0; visible: false}
                PropertyChanges{ target: login_Frame; opacity: 1 ; visible: true}
            },
            State{
                name: "register_state"
                PropertyChanges{ target: second_Frame; opacity: 0; visible: false}
                PropertyChanges{ target: register_Frame; opacity: 1; visible: true}
            }]

        transitions: [Transition {
            to: "login_state"
            PropertyAnimation{
                property: "opacity"
                duration: 1000
            }
        },
        Transition {
            to: "register_state"
            PropertyAnimation{
                property: "opacity"
                duration: 1000
            }
        }]
    }

    Rectangle{
        id: login_Frame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 250
        opacity: 0
        visible: false
        state: "login_state"
        Rectangle {
            id: back_btn_log
            width: 10
            height: 10
            x: 15
            y: 15
            Text{
                id: back_txt_log
                color: "black"
                font.pixelSize: 15
                text: "<"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    back_txt_log.color = "#727272"
                }
                onReleased: {
                    back_txt_log.color = "black"
                }
                onEntered: {
                    back_txt_log.color = "#4f4f4f"
                }
                onExited: {
                    back_txt_log.color = "black"
                }

                onClicked: {
                    login_Frame.state = "login_state1"
                    second_Frame.state = ""
                }
            }
        }
        Column{
            anchors.fill: parent
            padding: 32
            spacing: 32
            TextField{
                id: login_Field
                width: 200
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 13
                selectByMouse: true
                placeholderText: "Login"
                color: "#535353"
                background: Rectangle{
                    id: login_Field_rec
                    color: "white"
                    radius: 5
                }
            }
            TextField{
                id: pass_field
                width: 200
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 13
                echoMode: TextInput.Password
                placeholderText: "Password"
                color: "#535353"
                background: Rectangle{
                    id: pass_field_rec
                    color: "white"
                    radius: 5
                }
            }
            BusyIndicator {
                id: busy_ind
                width: 40
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                visible: false
                running: false
            }

            Rectangle {
                id: enter_btn
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40
                color: "#f6f6f6"
                Text{
                    color: "black"
                    font.pixelSize: 15
                    text: "Enter"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.color = "#bbbbbb"
                    }
                    onReleased: {
                        parent.color = "#f6f6f6"
                    }
                    onEntered: {
                        parent.color = "#d6d6d6"
                    }
                    onExited: {
                        parent.color = "#f6f6f6"
                    }

                    onClicked: {
                        if(login_Field.text !== login && pass_field.text !== password){
                            enter_fail.start()
                        }
                        else if(login_Field.text === login && pass_field.text === password && login_Field.text !== "" && pass_field.text !== ""){
                            enter_btn.visible = false
                            busy_ind.visible = true
                            busy_ind.running = true
                            bus_ind_anim.start();
                        }
                    }
                }
            }
        }

        states: [State{
            name: "login_state1"
            PropertyChanges{ target: login_Frame; opacity: 0; visible: false}
            PropertyChanges{ target: second_Frame; opacity: 1; visible: true}
        },
        State{
                name: "main_state"
                PropertyChanges{ target: login_Frame; opacity: 0; visible: false}
                PropertyChanges{ target: main_Frame; opacity: 1; visible: true}
            }
        ]
        transitions: [Transition {
            to: "login_state1"
            PropertyAnimation{
                property: "opacity"
                duration: 1000
            }
        }, Transition{
                to: "main_state"
                PropertyAnimation{
                    property: "opacity"
                    duration: 1000
                }
            }
        ]
    }

    Rectangle{
        id: register_Frame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 250
        opacity: 0
        visible: false
        state: "register_state"
        Rectangle {
            id: back_btn_reg
            width: 10
            height: 10
            x: 15
            y: 25
            Text{
                id: back_txt
                color: "black"
                font.pixelSize: 15
                text: "<"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    back_txt.color = "#727272"
                }
                onReleased: {
                    back_txt.color = "black"
                }
                onEntered: {
                    back_txt.color = "#4f4f4f"
                }
                onExited: {
                    back_txt.color = "black"
                }

                onClicked: {
                    register_Frame.state = "register_state1"
                    second_Frame.state = ""
                }
            }
        }

        Column{
            anchors.fill: parent
            padding: 18
            spacing: 18
            TextField{
                id: login_reg_Field
                width: 200
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 13
                selectByMouse: true
                placeholderText: "Login"
                color: "#535353"
                background: Rectangle{
                    id: login_reg_Field_rec
                    color: "white"
                    radius: 5
                }
            }
            TextField{
                id: pass_reg_field
                width: 200
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 13
                echoMode: TextInput.Password
                placeholderText: "Password"
                color: "#535353"
                background: Rectangle{
                    id: pass_reg_field_rec
                    color: "white"
                    radius: 5
                }
            }
            TextField{
                id: pass_conf_reg_field
                width: 200
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 13
                echoMode: TextInput.Password
                placeholderText: "Confirm Password"
                color: "#535353"
                background: Rectangle{
                    id: pass_conf_reg_field_rec
                    color: "white"
                    radius: 5
                }
            }

            Rectangle {
                id: register_conf_btn
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40
                color: "#f6f6f6"
                Text{
                    color: "black"
                    font.pixelSize: 15
                    text: "Register"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.color = "#bbbbbb"
                    }
                    onReleased: {
                        parent.color = "#f6f6f6"
                    }
                    onEntered: {
                        parent.color = "#d6d6d6"
                    }
                    onExited: {
                        parent.color = "#f6f6f6"
                    }

                    onClicked: {
                        if(pass_reg_field.text !== "" &&
                                pass_conf_reg_field.text !== "" &&
                                pass_reg_field.text === pass_conf_reg_field.text &&
                                login_reg_Field.text !== ""){
                            login = login_reg_Field.text
                            password = pass_reg_field.text
                            register_Frame.state = "registered"
                            second_Frame.state = ""
                            success_anim.start()
                        }
                        if(login_reg_Field.text === ""){
                            fail_login.start()
                        }
                        if(pass_reg_field.text !== pass_conf_reg_field.text){
                            fail_pass.start()
                        }
                        if(pass_reg_field.text === ""){
                            fail_pass.start()
                        }
                        if(pass_conf_reg_field.text === ""){
                            fail_pass.start()
                        }
                    }
                }
            }
        }

        states: [State{
            name: "registered"
            PropertyChanges{ target: register_Frame; opacity: 0; visible: false}
            PropertyChanges{ target: second_Frame; opacity: 1; visible: true}
        },
            State{
                name: "register_state1"
                PropertyChanges{ target: register_Frame; opacity: 0; visible: false}
                PropertyChanges{ target: second_Frame; opacity: 1; visible: true}
            }

        ]
        transitions: [ Transition {
            to: "registered"
            PropertyAnimation{
                property: "opacity"
                duration: 1000
            }
        },Transition {
                to: "register_state1"
                PropertyAnimation{
                    property: "opacity"
                    duration: 1000
                }
            }
        ]

    }

    Rectangle{
        id: main_Frame
        color: "white"
        width: parent.width
        height: parent.height
        opacity: 0
        visible: false
        state: "main_state"
        ListModel{
            id: books
            ListElement{
                name: "Anna Karenina"
                genre: "Realist novel"
                author: "Leo Tolstoy"
                icon: "qrc:/anna_karenina.png"
            }
            ListElement{
                name: "Madame Bovary"
                genre: "Realist novel"
                author: "Gustave Flaubert"
                icon: "qrc:/madame_bovary.png"
            }
            ListElement{
                name: "War and Peace"
                genre: "Historical novel"
                author: "Leo Tolstoy"
                icon: "qrc:/war_and_peace.png"
            }
            ListElement{
                name: "Lolita"
                genre: "Novel"
                author: "Vladimir Nabokov"
                icon: "qrc:/lolita.png"
            }
            ListElement{
                name: "Middlemarch"
                genre: "Novel"
                author: "George Eliot"
                icon: "qrc:/middlemarch.png"
            }
            ListElement{
                name: "Hamlet"
                genre: "Tragedy"
                author: "William Shakespeare"
                icon: "qrc:/hamlet.png"
            }
            ListElement{
                name: "The Great Gatsby"
                genre: "Tragedy"
                author: "F. Scott Fitzgerald"
                icon: "qrc:/great_gatsby.png"
            }

            ListElement{
                name: "Macbeth"
                genre: "Tragedy"
                author: "William Shakespeare"
                icon: "qrc:/macbeth.png"
            }
            ListElement{
                name: "Pride and Prejudice"
                genre: "Romance novel"
                author: "Jane Austen"
                icon: "qrc:/prideandprejudice.png"
            }
            ListElement{
                name: "Jane Eyre"
                genre: "Romance novel"
                author: "Charlotte Brontë"
                icon: "qrc:/jane_eyre.png"
            }


        }
        ListView {
            id: book_list
            anchors.fill: parent
            model: books
            spacing: 1
            focus: true
            header: Rectangle{
                width: parent.width
                height: 40
                color: "#e5ecef"
                Text{
                    anchors.centerIn: parent
                    text: "This Library Contains 10 Books. The Main Genres Are Novels And Tragedies"
                    color: "black"

                }
            }

            footer: Rectangle{
                width: parent.width
                height: 40
                color: "#e5ecef"
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "e.g. Copyright © 2022 Eric Grigoryan. All rights reserved."
                    color: "black"
                }

            }

            section.delegate: Rectangle {
                width: parent.width
                height: 20
                color: "#8dbfc9"
                Text{
                    anchors.centerIn: parent
                    text: section
                    color: "black"
                    font.weight: Font.Bold
                }
            }
            section.property: "genre"

            delegate: Rectangle {
                width: book_list.width
                height: 150
                radius: 3
                border.width: 1
                border.color: "darkgray"
                color: "lightgray"
                Column{
                    anchors.fill: parent
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Image{
                            width: 60
                            height: 90
                            source: icon
                        }
                        spacing: 20
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text {text: "Book Name :" ; font.weight: Font.Bold}
                        Text {text: name}
                        spacing: 20
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text {text: "Author :" ; font.weight: Font.Bold}
                        Text {text: author}
                        spacing: 20
                    }
                }
            }
        }
    }




    PropertyAnimation{
        id: fail_login
        target: login_reg_Field_rec
        property: "color"
        from: "dark red"
        to: "white"
        duration: 500

    }
    PropertyAnimation{
        id: fail_pass
        targets: [pass_reg_field_rec, pass_conf_reg_field_rec]
        property: "color"
        from: "dark red"
        to: "white"
        duration: 500

    }
    PropertyAnimation{
        id: enter_fail
        targets: [login_Field_rec, pass_field_rec]
        property: "color"
        from: "dark red"
        to: "white"
        duration: 500

    }

    PropertyAnimation{
        id: cant_reg_anim
        target: cant_register
        property: "color"
        from: "black"
        to: "white"
        duration: 3000
    }

    PropertyAnimation{
        id: success_anim
        target: success
        property: "color"
        from: "black"
        to: "white"
        duration: 3000
    }

    PropertyAnimation{
        id: bus_ind_anim
        target: busy_ind
        property: "opacity"
        from: 1
        to: 0
        duration: 1000
        onRunningChanged: {
            if(!bus_ind_anim.running){
                login_Frame.state = "main_state"
            }
        }
    }


}
