import 'package:flutter/cupertino.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooHeader extends StatelessWidget {
  const FidoooHeader({
    Key? key,
    required this.headerTitle,
    required this.width,
  }) : super(key: key);

  final String headerTitle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: const BoxDecoration(
        color: FidoooColors.secondary,
      ),
      child: Text(
        headerTitle,
        style: const FidoooTypography.headlineSmall(
            color: FidoooColors.primaryColor),
      ),
    );
  }
}
