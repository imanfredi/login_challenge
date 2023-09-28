import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/views/auth_screen.dart';
import 'package:login/auth/views/sign_in_screen.dart';
import 'package:login/auth/views/sign_up_screen.dart';
import 'package:login/core/views/device_widget.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const DeviceWidget(child: AuthScreen()));
    r.child('/signIn',
        child: (context) => const DeviceWidget(child: SignInScreen()));
    r.child('/signUp',
        child: (context) => const DeviceWidget(child: SignUpScreen()));
  }
}
