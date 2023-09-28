import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/user/app_store.dart';
import 'package:login/user/data/datasources/user_data_source.dart';
import 'package:login/user/data/repositories/user_repository_impl.dart';
import 'package:login/user/domain/repositories/user_repository.dart';
import 'package:login/user/views/dashboard_screen.dart';

class DashboardModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const DashboardScreen());
  }

  @override
  void binds(Injector i) {
    i.addSingleton<UserDatasource>(UserDatasourceImpl.new);
    i.addSingleton<UserRepository>(UserRepositoryImpl.new);
    i.addSingleton<AppStore>(AppStore.new);
    super.binds(i);
  }
}
