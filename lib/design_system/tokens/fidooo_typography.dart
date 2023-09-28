import 'package:flutter/material.dart';

class FidoooTypography extends TextStyle {
  const FidoooTypography({
    required Color? color,
    required FontWeight fontWeight,
    required double fontSize,
  }) : super(
          fontFamily: 'Roboto',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );

  static const _headlineLarge = 24.0;
  static const _headlineMedium = 20.0;
  static const _headlineSmall = 16.0;
  static const _bodyLarge = 16.0;
  static const _bodyMedium = 14.0;
  static const _bodySmall = 12.0;

  const FidoooTypography.headlineLarge({
    required Color color,
  }) : this(
          fontSize: _headlineLarge,
          fontWeight: FontWeight.w600,
          color: color,
        );

  const FidoooTypography.headlineMedium({
    required Color color,
  }) : this(
          fontSize: _headlineMedium,
          fontWeight: FontWeight.w500,
          color: color,
        );

  const FidoooTypography.headlineSmall({
    required Color color,
  }) : this(
          fontSize: _headlineSmall,
          fontWeight: FontWeight.w600,
          color: color,
        );

  const FidoooTypography.bodyLarge({
    required Color color,
  }) : this(
          fontSize: _bodyLarge,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const FidoooTypography.bodyMedium({
    required Color color,
  }) : this(
          fontSize: _bodyMedium,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const FidoooTypography.bodySmall({
    required Color color,
  }) : this(
          fontSize: _bodySmall,
          fontWeight: FontWeight.w400,
          color: color,
        );
}
