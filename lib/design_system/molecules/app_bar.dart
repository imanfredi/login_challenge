import 'package:flutter/material.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooAppBar extends AppBar {
  FidoooAppBar({
    required String title,
    Key? key,
    Widget? leading,
    List<Widget>? actions,
  }) : super(
          key: key,
          leading: leading,
          actions: actions,
          backgroundColor: FidoooColors.primaryColor,
          surfaceTintColor: FidoooColors.primaryColor,
          elevation: 20,
          centerTitle: false,
          title: Title(
            color: FidoooColors.greyDark1,
            child: Text(
              title,
              style: const FidoooTypography.headlineLarge(
                color: FidoooColors.greyDark1,
              ),
            ),
          ),
        );
}
