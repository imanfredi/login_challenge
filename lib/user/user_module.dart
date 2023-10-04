import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/user/controllers/user_post_form_controller.dart';
import 'package:login/user/controllers/user_posts_controller.dart';
import 'package:login/user/repositories/user_repository.dart';
import 'package:login/user/repositories/user_repository_impl.dart';
import 'package:login/user/views/user_screen.dart';

class UserModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const UserScreen());
  }

  @override
  void binds(Injector i) {
    i.addSingleton<UserPostFormController>(UserPostFormController.new);
    i.addSingleton<UserPostsController>(UserPostsController.new);
    i.addSingleton<UserRepository>(UserRepositoryImpl.new);
    super.binds(i);
  }
}
