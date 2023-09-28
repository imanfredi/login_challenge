import 'package:flutter/material.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';

class FidoooIcons extends Icon {
  FidoooIcons({
    Key? key,
    required IconData icon,
    required FidoooIconStatus status,
    double size = 48,
  }) : super(
          key: key,
          icon,
          color: status.color,
          size: size,
        );

  /// Logout Icon
  FidoooIcons.logout({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.logout,
          status: status,
        );
}

enum FidoooIconStatus {
  enabled(FidoooColors.secondary);

  final Color color;

  const FidoooIconStatus(this.color);
}
