import 'package:flutter/material.dart';

class FidoooShadows {
  FidoooShadows._();

  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
    ),
  ];
}
