import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/design_system/molecules/buttons/fidooo_elevated_button.dart';
import 'package:login/design_system/molecules/buttons/fidooo_social_button.dart';
import 'package:login/design_system/molecules/input/fidooo_text_field.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';
import 'package:provider/provider.dart';

final signInFormKey = GlobalKey<FormBuilderState>();

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(40),
      child: FormBuilder(
        key: signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Log in",
              style: FidoooTypography.headlineLarge(
                color: FidoooColors.primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  FidoooTextField(
                    formField: 'email',
                    initialValue: '',
                    password: false,
                    label: 'Email',
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Ingrese su email"),
                      FormBuilderValidators.email(
                          errorText: "Ingrese un mail válido"),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FidoooTextField(
                    formField: 'password',
                    initialValue: '',
                    label: 'Contraseña',
                    password: true,
                    validators: [
                      FormBuilderValidators.required(
                        errorText: "Ingrese su contraseña",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return authController.hasErrorMessage
                    ? Column(
                        children: [
                          Text(
                            authController.errorMessage!,
                            style: const FidoooTypography.bodyLarge(
                              color: FidoooColors.error,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : const SizedBox(height: 30);
              },
            ),
            Column(
              children: [
                SizedBox(
                  width: 360,
                  child: FidoooElevatedButton(
                    text: "Log in",
                    onPressed: () => onSubmit(context),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Olvidaste tu contraseña"),
                const SizedBox(
                  height: 15,
                ),
                SocialButton(
                  path: '/images/google.png',
                  onTap: () => onGoogleSignIn(),
                  height: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSubmit(BuildContext context) async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }

    final String email = signInFormKey.currentState!.fields['email']!.value;
    final String password =
        signInFormKey.currentState!.fields['password']!.value;

    bool success = await Modular.get<AuthController>()
        .signIn(email: email, password: password);
    if (success) {
      Modular.to.navigate('/dashboards/');
    }
  }

  Future<void> onGoogleSignIn() async {
    bool success = await Modular.get<AuthController>().signInWithGoogle();
    if (success) {
      Modular.to.navigate('/dashboards/');
    }
  }

  @override
  void dispose() {
    Modular.get<AuthController>().setErrorMessage(null);
    super.dispose();
  }
}
