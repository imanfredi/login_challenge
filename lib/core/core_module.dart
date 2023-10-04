import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/auth/repositories/auth_repository.dart';
import 'package:login/auth/repositories/auth_repository_impl.dart';
import 'package:login/stores/device/screen_size_store.dart';
import 'package:login/user/repositories/user_repository.dart';
import 'package:login/user/repositories/user_repository_impl.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<UserRepository>(UserRepositoryImpl.new);
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);
    super.binds(i);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton<Logger>(Logger.new);
    i.addSingleton<AuthStore>(AuthStore.new);
    i.addSingleton<ScreenSizeStore>(ScreenSizeStore.new);
    super.exportedBinds(i);
  }
}
