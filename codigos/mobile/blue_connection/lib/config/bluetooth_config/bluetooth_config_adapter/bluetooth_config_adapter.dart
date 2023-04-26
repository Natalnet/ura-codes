import '../../../src/module/shared/domain/entities/blue_device.dart';
import 'package:blue_connection/config/bluetooth_config/enum/bluetooth_status.dart';
import 'package:blue_connection/config/bluetooth_config/enum/device_status.dart';

abstract class BluetoothConfigAdapter {
  Future<BluetoothStatus> requestEnable();

  Future<BluetoothStatus> requestDisable();

  Future<List<Device>> scanDevices();

  Future<DeviceStatus> connectDevice(Device device);

  Future<DeviceStatus> disconnectDevice(Device device);

  Future<DeviceStatus> reconnectDevice(Device device);
}
