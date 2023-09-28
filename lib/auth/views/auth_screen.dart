import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/core/screen_controller.dart';
import 'package:login/design_system/molecules/buttons/fidooo_elevated_button.dart';
import 'package:login/design_system/molecules/buttons/fidooo_outlined_button.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      ScreenType screenType = Provider.of<ScreenController>(context).screenType;
      return Scaffold(
        body: screenType == ScreenType.Web
            ? _buildWebWidget()
            : screenType == ScreenType.Mobile
                ? _buildMobileWidget()
                : _buildTabletWidget(),
      );
    });
  }

  Widget _buildMobileWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            width: 200,
            image: AssetImage(
              'assets/images/fidooo_logo.png',
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Bienvenido a Fidoo",
          textAlign: TextAlign.center,
          style: FidoooTypography.headlineLarge(
            color: FidoooColors.darkMode,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: FidoooElevatedButton(
                text: 'Iniciar sesión',
                onPressed: () async {
                  await Modular.to.pushNamed('/auth/signIn');
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: FidoooOutlinedButton(
                text: 'Registrarse',
                onPressed: () async {
                  await Modular.to.pushNamed('/auth/signUp');
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTabletWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            width: 200,
            image: AssetImage(
              'assets/images/fidooo_logo.png',
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Bienvenido a Fidoo",
          textAlign: TextAlign.center,
          style: FidoooTypography.headlineLarge(
            color: FidoooColors.darkMode,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: FidoooElevatedButton(
                text: 'Iniciar sesión',
                onPressed: () async {
                  await Modular.to.pushNamed('/auth/signIn');
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 150,
              child: FidoooOutlinedButton(
                text: 'Registrarse',
                onPressed: () async {
                  await Modular.to.pushNamed('/auth/signUp');
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildWebWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            width: 300,
            image: AssetImage(
              'assets/images/fidooo_logo.png',
            ),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Bienvenido a Fidoo",
              style: FidoooTypography.headlineLarge(
                color: FidoooColors.darkMode,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: FidoooElevatedButton(
                    text: 'Iniciar sesión',
                    onPressed: () async {
                      await Modular.to.pushNamed('/auth/signIn');
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 150,
                  child: FidoooOutlinedButton(
                    text: 'Registrarse',
                    onPressed: () async {
                      await Modular.to.pushNamed('/auth/signUp');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
