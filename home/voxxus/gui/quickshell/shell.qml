import Quickshell
import Quickshell.Io
import QtQuick

Scope {
	id: root

	property string time

	Variants {
		model: Quickshell.screens
		
		PanelWindow {
			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30

			Text {
				id: clock
				anchors.centerIn: parent
				text: root.time
			}
		}
	}
		
	Process {
		id: dateProc
		command: ["date"]
		running: true

		stdout: StdioCollector {
			onStreamFinished: root.time = text
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: dateProc.running = true
	}
}
