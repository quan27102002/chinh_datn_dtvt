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
    name: 'Thiết bị 1',
    type: DeviceType.light,
    active: true,
    room: 'Phòng khách',
    path: "device1",
  ),
  Device(
    name: 'Thiết bị 2',
    type: DeviceType.light,
    active: true,
    room: 'Phòng khách',
    path: "device2",
  ),
  Device(
    name: 'Thiết bị 3',
    type: DeviceType.light,
    active: true,
    room: 'Phòng khách',
    path: "device3",
  ),
  Device(
      name: 'Thiết bị 4',
      type: DeviceType.light,
      active: true,
      room: 'Phòng khách',
      path: "device4"),
  Device(
    name: 'Quạt',
    type: DeviceType.ac,
    active: true,
    room: 'Phòng bếp',
    path: "fan",
  ),
  Device(
    name: 'Bơm',
    type: DeviceType.cctv,
    active: true,
    room: 'Phòng bếp',
    path: "pump",
  ),
];
List<Device> devicesSensor = [
  Device(
    name: 'Cảm biến CO',
    type: DeviceType.light,
    active: true,
    room: 'co',
    path: "device1",
  ),
  Device(
    name: 'Cảm biến nhiệt độ',
    type: DeviceType.light,
    active: true,
    room: 'temp',
    path: "device2",
  ),
  Device(
    name: 'Cảm biến độ ẩm',
    type: DeviceType.light,
    active: true,
    room: 'humi',
    path: "device3",
  ),
  Device(
      name: 'Cảm biến bụi mịn PM01',
      type: DeviceType.light,
      active: true,
      room: 'pm01',
      path: "device4"),
  Device(
    name: 'Cảm biến bụi mịn PM25',
    type: DeviceType.microwave,
    active: true,
    room: 'pm25',
    path: "device4",
  ),
  Device(
    name: 'Cảm biến bụi PM10',
    type: DeviceType.light,
    active: true,
    room: 'pm10',
    path: "device5",
  ),
];
