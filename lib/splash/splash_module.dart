import 'package:flutter_modular/flutter_modular.dart';

import 'views/splash_screen.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashScreen());
    super.routes(r);
  }
}
