import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.path,
    required this.height,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function() onTap;
  final String path;
  final double height;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          child: Image.asset(
            path,
            height: height,
          ),
        ),
      ),
    );
  }
}
