import 'package:bloc/bloc.dart';
import 'package:blue_connection/config/bluetooth_config/bluetooth_controller/bluetooth_controller.dart';
import 'package:blue_connection/config/bluetooth_config/enum/bluetooth_status.dart';
import 'package:blue_connection/config/bluetooth_config/enum/device_status.dart';
import 'package:blue_connection/src/module/shared/domain/entities/blue_device.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BluetoothController bluetoothController;
  List<Device> bondedDevices = [];
  HomeBloc(this.bluetoothController) : super(HomeState.empty()) {
    on(_onEvent);
  }

  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeState.loading());

    await event.when(enabledBluetooth: () async {
      await bluetoothController.requestEnable().timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          emit(HomeState.error());
        },
      );

      bluetoothController.bluetoothStatus == BluetoothStatus.enabled
          ? emit(HomeState.sucessEnabledBluetooth())
          : emit(HomeState.error());
    }, disabledBluetooth: () async {
      await bluetoothController.requestDisable();

      bluetoothController.bluetoothStatus == BluetoothStatus.disabled
          ? emit(HomeState.sucessDisabledBluetooth())
          : emit(HomeState.error());
    }, requestBondedDevices: () async {
      bondedDevices = [];
      await bluetoothController.scanDevices().timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          emit(HomeState.error());
        },
      );
      bondedDevices = bluetoothController.devices;
      emit(HomeState.sucessBondedDevices());
    }, requestBluetoothDispose: () {
      bondedDevices = [];
      emit(HomeState.sucessBluetoothDisposed());
    }, requestConnectDevice: (device) async {
      await bluetoothController.connectDevice(device: device).timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          emit(HomeState.error());
        },
      );
      device.status == DeviceStatus.connected
          ? emit(HomeState.sucessDeviceConnected())
          : emit(HomeState.error());
    }, requestDisconnectDevice: (device) async {
      await bluetoothController.disconnectDevice(device: device);

      device.status == DeviceStatus.disconnected
          ? emit(HomeState.sucessDeviceDisconnected())
          : emit(HomeState.error());
    });
  }
}
