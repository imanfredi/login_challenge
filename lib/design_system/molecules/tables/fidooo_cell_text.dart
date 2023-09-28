import 'package:flutter/cupertino.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooCellText extends StatelessWidget {
  const FidoooCellText({Key? key, required this.cellText, required this.width})
      : super(key: key);

  final String cellText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: const BoxDecoration(
        color: FidoooColors.secondary,
      ),
      child: Text(
        cellText,
        overflow: TextOverflow.ellipsis,
        style: const FidoooTypography.bodyMedium(
          color: FidoooColors.greyLight10,
        ),
      ),
    );
  }
}
