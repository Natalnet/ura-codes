import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.empty() = _HomeStateEmpty;
  factory HomeState.loading() = _HomeStateLoading;
  factory HomeState.error() = _HomeStateError;
  factory HomeState.sucessEnabledBluetooth() = _HomeStateSucessEnabledBluetooth;
  factory HomeState.sucessDisabledBluetooth() =
      _HomeStateSucessDisabledBluetooth;
  factory HomeState.sucessBondedDevices() = _HomeStateSucessBondedDevices;
  factory HomeState.sucessBluetoothDisposed() =
      _HomeStateSucessBluetoothDisposed;
  factory HomeState.sucessDeviceConnected() = _HomeStateSucessDeviceConnected;
  factory HomeState.sucessDeviceDisconnected() =
      _HomeStateSucessDeviceDisconnected;
}
