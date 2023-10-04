import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/posts/controllers/todos_controller.dart';
import 'package:login/posts/repositories/todos_api.dart';
import 'package:login/posts/views/dashboard_screen.dart';

class DashboardModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const DashboardScreen());
  }

  @override
  void binds(Injector i) {
    i.addSingleton<Dio>(() => Dio());
    i.addSingleton<TodosRepository>(TodosRepository.new);
    i.addSingleton<TodosController>(TodosController.new);
    super.binds(i);
  }
}
