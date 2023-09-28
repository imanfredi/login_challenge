import 'package:flutter/material.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooElevatedButton extends StatefulWidget {
  const FidoooElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 40.0,
    this.iconData,
  }) : super(key: key);

  final String text;
  final double height;
  final Future<void> Function() onPressed;
  final IconData? iconData;

  @override
  State<FidoooElevatedButton> createState() => _FidoooElevatedButtonState();
}

class _FidoooElevatedButtonState extends State<FidoooElevatedButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ElevatedButton(
        onPressed: () => isLoading ? null : onPressed(),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(FidoooColors.secondary),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return FidoooColors.secondaryVar;
              }
              if (states.contains(MaterialState.focused)) {
                return FidoooColors.secondaryVar;
              }
              if (states.contains(MaterialState.pressed)) {
                return FidoooColors.secondaryVar;
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
                    color: FidoooColors.primaryColor,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.text,
                    style: const FidoooTypography.bodyLarge(
                      color: FidoooColors.primaryColor,
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
    await widget.onPressed();
    setState(() {
      isLoading = false;
    });
  }
}
