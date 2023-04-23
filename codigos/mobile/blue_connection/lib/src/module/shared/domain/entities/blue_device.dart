import 'package:blue_connection/config/bluetooth_config/enum/device_status.dart';

class Device {
  final String name;
  DeviceStatus status;

  Device({
    this.name = 'default',
    this.status = DeviceStatus.notConnected,
  });

  @override
  operator ==(Object other) {
    return other is Device && other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}
