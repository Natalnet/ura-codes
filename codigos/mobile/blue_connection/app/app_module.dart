import 'package:blue_connection/config/bluetooth_config/bluetooth_controller/bluetooth_controller.dart';
import 'package:blue_connection/src/module/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => BluetoothController()),
      ];
  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: HomeModule())];
}
