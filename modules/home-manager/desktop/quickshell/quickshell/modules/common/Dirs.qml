pragma Singleton
import QtQuick
import Quickshell

Singleton {
  id: root

  property string assetsPath: Quickshell.shellPath("assets")

}