enum BluetoothStatus { enabled, disabled, error, unknow }

extension BluetoothStatusExt on BluetoothStatus {
  bool get enabled => this == BluetoothStatus.enabled ? true : false;
}
