import QtQuick
import Quickshell
import Quickshell.Io
pragma Singleton

Singleton {
    id: root

    property var cpuUsage
    property var cpuTemp
    property var ramUsage
    

    Process {
        id: cpuProc

        property var cpuSamples: []

        command: ["/bin/sh", "-c", "top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let value = parseFloat(this.text.trim());
                if (!isNaN(value)) {
                    if (cpuProc.cpuSamples.length >= 6)
                        cpuProc.cpuSamples.shift();

                    cpuProc.cpuSamples.push(value);
                    let sum = cpuProc.cpuSamples.reduce((a, b) => {
                        return a + b;
                    }, 0);
                    cpuUsage = (sum / cpuProc.cpuSamples.length).toFixed(0);
                }
            }
        }

    }

    Process {
        id: tempProc

        command: ["/bin/sh", "-c", "sensors | grep 'Package id 0:' | awk '{print $4}' | tr -d '+°C'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let value = parseFloat(this.text.trim());
                cpuTemp = value;
            }
        }

    }

    Process {
        id: ramProc

        command: ["/bin/sh", "-c", "free -m | awk '/Mem:/ { printf(\"%3.0f\", $3/$2*100) }'"]

        stdout: StdioCollector {
            onStreamFinished: {
                let value = parseInt(this.text.trim());
                ramUsage = value;
            }
        }

    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true;
            tempProc.running = true;
            ramProc.running = true;
        }
    }

}
