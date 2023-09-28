import 'package:flutter/material.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooOutlinedButton extends StatefulWidget {
  const FidoooOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 40.0,
    this.iconData,
  }) : super(key: key);

  final double height;
  final String text;
  final VoidCallback onPressed;
  final IconData? iconData;

  @override
  State<FidoooOutlinedButton> createState() => _FidoooOutlinedButtonState();
}

class _FidoooOutlinedButtonState extends State<FidoooOutlinedButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: OutlinedButton(
        onPressed: () => isLoading ? null : onPressed(),
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: FidoooColors.primaryColorVar,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return FidoooColors.secondary;
              }
              if (states.contains(MaterialState.focused)) {
                return FidoooColors.secondary;
              }
              if (states.contains(MaterialState.pressed)) {
                return FidoooColors.secondary;
              }
              return null;
            },
          ),
        ),
        child: widget.iconData != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.iconData,
                    color: FidoooColors.primaryColorVar,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.text,
                    style: const FidoooTypography.bodyLarge(
                      color: FidoooColors.primaryColorVar,
                    ),
                  ),
                ],
              )
            : Text(
                widget.text,
                style: const FidoooTypography.bodyLarge(
                  color: FidoooColors.primaryColor,
                ),
              ),
      ),
    );
  }

  void onPressed() async {
    setState(() {
      isLoading = true;
    });
    widget.onPressed();
    setState(() {
      isLoading = false;
    });
  }
}
