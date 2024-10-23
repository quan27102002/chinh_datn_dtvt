import 'package:datn_trung/util/enums.dart';

class Device {
  String? name;
  DeviceType type;
  bool active;
  String room;
  String path;

  Device({
    this.name,
    required this.type,
    required this.active,
    required this.room,
    required this.path,
  });
}

List<Device> devices = [
  Device(
    name: 'AC',
    type: DeviceType.ac,
    active: true,
    room: 'Living Room',
    path: "device1",
  ),
  Device(
    name: 'Smart TV',
    type: DeviceType.smartTv,
    active: true,
    room: 'Living Room',
    path: "device2",
  ),
  Device(
    name: 'CCTV',
    type: DeviceType.cctv,
    active: true,
    room: 'Living Room',
    path: "device3",
  ),
  Device(
      name: 'Refridgerator',
      type: DeviceType.refridgerator,
      active: true,
      room: 'Living Room',
      path: "device4"),
  Device(
    name: 'Microwave',
    type: DeviceType.microwave,
    active: true,
    room: 'Living Room',
    path: "device4",
  ),
  Device(
    name: 'Light',
    type: DeviceType.light,
    active: true,
    room: 'Living Room',
    path: "device5",
  ),
];
