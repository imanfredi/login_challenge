import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/auth_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  bool canActivate(String path, ModularRoute router) {
    return Modular.get<AuthStore>().isAuthenticated;
  }
}
