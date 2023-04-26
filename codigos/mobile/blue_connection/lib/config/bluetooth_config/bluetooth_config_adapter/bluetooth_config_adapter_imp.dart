import 'dart:async';

import 'package:blue_connection/config/bluetooth_config/enum/bluetooth_status.dart';
import 'package:blue_connection/config/bluetooth_config/enum/device_status.dart';
import 'package:blue_connection/src/module/shared/domain/entities/blue_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    hide BluetoothDevice, BluetoothState;

import 'bluetooth_config_adapter.dart';

class BluetoothConfigAdapterImpl implements BluetoothConfigAdapter {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  final FlutterBluetoothSerial bluetoothSerial =
      FlutterBluetoothSerial.instance;
  List<BluetoothDevice> _devices = [];
  late StreamSubscription _subscriptionScan;
  late StreamSubscription _subscriptionConnect;
  BluetoothConfigAdapterImpl._();

  static final instance = BluetoothConfigAdapterImpl._();

  @override
  Future<BluetoothStatus> requestEnable() async {
    BluetoothStatus bluetoothStatus = BluetoothStatus.unknow;
    try {
      await bluetoothSerial.requestEnable().then(
        (value) {
          if (value ?? false) {
            bluetoothStatus = BluetoothStatus.enabled;
          } else {
            bluetoothStatus = BluetoothStatus.disabled;
          }
        },
        onError: (_) => bluetoothStatus = BluetoothStatus.error,
      );

      return bluetoothStatus;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      debugPrint(e.stacktrace);
      return bluetoothStatus = BluetoothStatus.error;
    } catch (e) {
      return bluetoothStatus = BluetoothStatus.error;
    }
  }

  @override
  Future<BluetoothStatus> requestDisable() async {
    BluetoothStatus bluetoothStatus = BluetoothStatus.unknow;
    try {
      await bluetoothSerial.requestDisable().then(
        (value) {
          if (value ?? false) {
            bluetoothStatus = BluetoothStatus.disabled;
          } else {
            bluetoothStatus = BluetoothStatus.enabled;
          }
        },
        onError: (_) => bluetoothStatus = BluetoothStatus.error,
      );
      return bluetoothStatus;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      debugPrint(e.stacktrace);
      return bluetoothStatus = BluetoothStatus.error;
    } catch (e) {
      return bluetoothStatus = BluetoothStatus.error;
    }
  }

  @override
  Future<List<Device>> scanDevices() async {
    List<Device> _devicesLocal = [];

    try {
      await flutterBlue.startScan(
        timeout: const Duration(seconds: 5),
        allowDuplicates: false,
      );
      _subscriptionScan = flutterBlue.scanResults.listen((results) {
        for (ScanResult r in results) {
          _devices.add(r.device);
        }
      });
      await Future.delayed(const Duration(seconds: 5));
      await flutterBlue.stopScan();

      for (var element in _devices) {
        _devicesLocal.add(
          Device(
            name: element.name.isNotEmpty ? element.name : element.id.id,
            status: DeviceStatus.notConnected,
          ),
        );
      }

      return _devicesLocal;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      debugPrint(e.stacktrace);
      return _devicesLocal;
    } catch (e) {
      return _devicesLocal;
    }
  }

  @override
  Future<DeviceStatus> connectDevice(Device device) async {
    try {
      late DeviceStatus status;
      BluetoothDevice _deviceLocal =
          _devices.firstWhere((element) => element.name == device.name);

      _deviceLocal.connect();
      _subscriptionConnect = flutterBlue.state.listen((results) {
        if (results == BluetoothState.on) {
          status = DeviceStatus.connected;
        } else {
          status = DeviceStatus.notConnected;
        }
      });

      await Future.delayed(const Duration(seconds: 5));
      return status;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      debugPrint(e.stacktrace);
      return DeviceStatus.notConnected;
    } catch (e) {
      return DeviceStatus.notConnected;
    }
  }

  @override
  Future<DeviceStatus> disconnectDevice(Device device) async {
    try {
      late DeviceStatus status;
      BluetoothDevice _deviceLocal =
          _devices.firstWhere((element) => element.name == device.name);
      await _deviceLocal.disconnect().onError(
        (error, stackTrace) {
          status = DeviceStatus.connected;
        },
      ).then(
        (value) {
          status = DeviceStatus.disconnected;
        },
      );
      await Future.delayed(const Duration(seconds: 5));
      return status;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      debugPrint(e.stacktrace);
      return DeviceStatus.notConnected;
    } catch (e) {
      return DeviceStatus.notConnected;
    }
  }

  void dispose() {
    _devices = [];
    _subscriptionScan.cancel();
  }

  @override
  Future<DeviceStatus> reconnectDevice(Device device) {
    throw UnimplementedError();
  }
}
