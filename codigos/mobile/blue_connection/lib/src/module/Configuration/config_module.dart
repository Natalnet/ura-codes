import 'package:blue_connection/src/module/Configuration/presentation/pages/config_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigModule extends Module {
  @override
  List<Bind<Object>> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ConfigPage()),
      ];
}
