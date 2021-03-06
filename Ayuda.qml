import QtQuick 2.0
import QtQuick.Controls 1.2
import Qt.labs.folderlistmodel 2.1
//import QtWebView 1.1
Item {
    id: raiz
    property int nindex: 0
    //anchors.fill: parent



    Rectangle{
        id: tb
        width: raiz.width/2
        height: app.fs*1.4
        color: app.c1
        opacity: raiz.nindex === 0 ? 1.0 : 0.5
        Text {
            id: txtTit
            text: qsTr("Detalles de unik")
            font.pixelSize: app.fs
            color: app.c4
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                raiz.nindex = 0
            }
        }
    }
    Rectangle{
        id: tb2
        width: raiz.width/2
        height: app.fs*1.4
        color: app.c1
        anchors.left: tb.right
        opacity: raiz.nindex === 1 ? 1.0 : 0.5
        Text {
            id: txtTit2
            text: qsTr("Ayuda de unik")
            font.pixelSize: app.fs
            color: app.c4
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                raiz.nindex = 1
            }
        }
    }
    Rectangle{
        visible: raiz.nindex===1
        width: raiz.width
        height: raiz.height-tb.height
        anchors.top: tb.bottom
        color: app.c5
        Rectangle{
            width: txtBtn1.contentWidth*1.2
            height: txtBtn1.contentHeight*1.2
            color: app.c2
            border.color: app.c1
            border.width: 2
            radius: height*0.1
            anchors.centerIn: parent
            MouseArea{
                anchors.fill: parent
                onClicked: Qt.openUrlExternally('http://www.unikode.org/2018/02/unik-documentation.html')
            }
            Text {
                id: txtBtn1
                text: 'Unik Documentaciòn'
                font.pixelSize: app.fs*2
                anchors.centerIn: parent
            }
        }
    }
    Rectangle{
        visible: raiz.nindex===0
        width: raiz.width
        height: raiz.height-tb.height
        anchors.top: tb.bottom
        color: app.c5
        Text {
            id: txtDetalles
            font.pixelSize: app.fs
            anchors.centerIn: parent
            color: app.c2
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            Component.onCompleted: {
                var det = '<b>unik version:</b> '+version
                det    += '<br><b>unik-tools version:</b> 1.1'
                det    += '<br><b>unik host:</b> '+host
                det    += '<br><b>user host:</b> '+userhost
                txtDetalles.text = det
            }
        }
    }
}
