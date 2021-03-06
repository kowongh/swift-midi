@testable import LUMI
import AudioToolbox
import XCPlayground

let hardware = Hardware()
let graph = AudioGraph()
var instrument: UInt8 = 0

hardware.onSetupChanged {
  hardware.connectedDeviceNames()
}

let musicDeviceNode = graph.createMusicDeviceNode()
let outputNode = graph.createDefaultOutputNode()
musicDeviceNode.connectTo(outputNode)
graph.start()

Message.MessageValue.NoteOn.rawValue

hardware.addMessageObserver { (event: Event) -> Void in
  MusicDeviceMIDIEvent(musicDeviceNode.unit, UInt32(event.status), UInt32(event.data1), UInt32(event.data2), 0)
}

  /*
  switch message {
  case .NoteOn(let channel, let key, let velocity):

  case .NoteOff(let channel, let key, let velocity):
    MusicDeviceMIDIEvent(musicDeviceNode.unit, UInt32(0x80 | channel), UInt32(key), UInt32(velocity), 0)

  case .ControlChange(let channel, let controller, let value):

    if controller == 10 {
      // Instrument change.
      MusicDeviceMIDIEvent(musicDeviceNode.unit, UInt32(0xC0 | channel), UInt32(value), 0, 0)
    } else if controller == 7 {
      // Volume
      MusicDeviceMIDIEvent(musicDeviceNode.unit, UInt32(0xB0 | channel), UInt32(0x07), UInt32(value), 0)
    }
    instrument = value
    controller
    channel
  case .PitchBend(let channel, let pitch):
    pitch
  default:
    print("bob")
    break
  }*/


XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
