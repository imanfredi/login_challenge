import 'package:flutter/cupertino.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooCellAvatar extends StatelessWidget {
  const FidoooCellAvatar({
    Key? key,
    required this.cellText,
    required this.width,
    required this.avatarUrl,
  }) : super(key: key);

  final String cellText;
  final String avatarUrl;
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/fidooo_logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              cellText,
              overflow: TextOverflow.ellipsis,
              style: const FidoooTypography.bodyMedium(
                color: FidoooColors.greyLight10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
