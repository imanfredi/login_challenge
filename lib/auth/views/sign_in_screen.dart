import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/stores/device/screen_size_store.dart';
import 'package:login/design_system/molecules/app_bar.dart';
import 'package:login/design_system/organism/forms/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  static const route = "/signIn";
  static const routeName = "signIn";

  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FidoooAppBar(
        title: "Inicio de sesión",
      ),
      body: Observer(
        builder: (BuildContext context) {
          ScreenType screenType = Modular.get<ScreenSizeStore>().screenType;

          return screenType == ScreenType.Web
              ? _buildWebWidget()
              : _buildTabletWidget();
        },
      ),
    );
  }

  Widget _buildWebWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            width: 300,
            image: AssetImage(
              'assets/images/fidooo_logo.png',
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SignInForm(),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image(
            width: 200,
            image: AssetImage(
              'assets/images/fidooo_logo.png',
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SignInForm(),
          ),
        ),
      ],
    );
  }
}
