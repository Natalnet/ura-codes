enum DeviceStatus { connected, disconnected, notConnected }

extension DeviceStatusExt on DeviceStatus {
  bool get connected {
    return this == DeviceStatus.connected ? true : false;
  }

  String get name {
    return this == DeviceStatus.connected
        ? 'Connected'
        : this == DeviceStatus.disconnected
            ? 'Disconnected'
            : 'NotConnected';
  }
}
