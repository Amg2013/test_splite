import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Blue decorations
  static BoxDecoration get blue => BoxDecoration(
        color: appTheme.blue600,
      );
// Fill decorations
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.1),
      );
  static BoxDecoration get fillOnPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static BoxDecoration get fillOnPrimaryContainer2 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.32),
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
// Gradient decorations
  static BoxDecoration get gradientPrimaryContainerToBlue => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.6, 1.13),
          end: Alignment(0.08, -0.98),
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(1),
            appTheme.blue600
          ],
        ),
      );
// Outline decorations
  static BoxDecoration get outlineOnPrimaryContainer => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          width: 5.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );
// Sd decorations
  static BoxDecoration get sd => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primaryContainer.withOpacity(0.06),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              8,
            ),
          )
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder21 => BorderRadius.circular(
        21.h,
      );
  static BorderRadius get circleBorder58 => BorderRadius.circular(
        58.h,
      );
// Rounded borders
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get roundedBorder44 => BorderRadius.circular(
        44.h,
      );
}
