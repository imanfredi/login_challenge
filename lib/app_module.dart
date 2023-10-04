import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/auth_module.dart';
import 'package:login/core/core_module.dart';
import 'package:login/splash/splash_module.dart';
import 'package:login/posts/post_module.dart';
import 'package:login/user/user_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/posts', module: DashboardModule());
    r.module('/users', module: UserModule());
  }
}
