import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/auth/data/datasources/auth_data_source.dart';
import 'package:login/auth/data/repositories/auth_repository_impl.dart';
import 'package:login/auth/domain/repositories/auth_repository.dart';
import 'package:login/core/screen_controller.dart';
import 'package:login/user/data/datasources/user_data_source.dart';
import 'package:login/user/data/repositories/user_repository_impl.dart';
import 'package:login/user/domain/repositories/user_repository.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<UserDatasource>(UserDatasourceImpl.new);
    i.addSingleton<AuthDataSource>(AuthDatasourceImpl.new);
    i.addSingleton<UserRepository>(UserRepositoryImpl.new);
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);
    super.binds(i);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton<AuthController>(AuthController.new);
    i.addSingleton<ScreenController>(ScreenController.new);
    super.exportedBinds(i);
  }
}
