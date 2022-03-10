import QtQuick 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "Components"

Pane {
    id: root

    // ==== START CONFIG ====

    // ==== Colors ====
    property string palBg: "#F5E9DA"
    property string palFg: "#575279"
    property string palOvr: "#EDD7BD"
    property string palPpl: "#907AA9"
    property string palGrn: "#569F84"

    // ==== UI Config ====
    // Note: Delay in milliseconds, set to undefined to disable
    property int cfgPasswordMaskDelay: 2000

    // ==== Sizing Config ====
    property int cfgPadding: 40

    // Note: Set to 0 to use cfgWidth for static width
    property int cfgWidthPerc: 30
    property int cfgWidth: 300

    property int cfgBorderWidth: 4

    property int cfgInputHeight: 35
    property int cfgInputSpacing: 10

    // ==== END CONFIG ====

    height: Screen.height
    width: Screen.ScreenWidth

    palette.button: "transparent"

    palette.text: palFg
    palette.buttonText: palFg
    palette.window: palBg

    font.family: config.Font
    font.pointSize: 12
    focus: true

    Item {
        id: sizeHelper

        anchors.fill: parent
        height: parent.height
        width: parent.width

        Rectangle {
            id: formBackground
            anchors.fill: form
            anchors.centerIn: form
            color: palBg
            border.color: palOvr
            border.width: cfgBorderWidth
            z: 1
        }

        LoginForm {
            id: form

            height: parent.height
            width: cfgWidthPerc == 0 ? parent.width - cfgWidth :
                                       parent.width * (cfgWidthPerc / 100)
            anchors.right: parent.right
            z: 1
        }

        Image {
            id: backgroundImage

            height: parent.height
            width: parent.width
            horizontalAlignment: Image.AlignLeft

            source: config.Background
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            cache: true
            clip: true
            mipmap: true
        }
    }
}
