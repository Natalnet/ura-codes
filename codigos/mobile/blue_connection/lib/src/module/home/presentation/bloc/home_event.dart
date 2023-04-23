import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/entities/blue_device.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  factory HomeEvent.enabledBluetooth() = _HomeEventEnabledBluetooth;
  factory HomeEvent.disabledBluetooth() = _HomeEventDisabledBluetooth;
  factory HomeEvent.requestBondedDevices() = _HomeEventRequestBondedDevices;
  factory HomeEvent.requestBluetoothDispose() =
      _HomeEventRequestBluetoothDispose;
  factory HomeEvent.requestConnectDevice({required Device device}) =
      _HomeEventRequestConnectDevice;
  factory HomeEvent.requestDisconnectDevice({required Device device}) =
      _HomeEventRequestDisconnectDevice;
}
