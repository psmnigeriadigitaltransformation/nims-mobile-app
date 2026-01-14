import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';

class NIMSTextStyles {
  static const String _defaultFontFamily = 'Inter';

  static Color get _defaultTextColor => NIMSColors.black;

  static final displayLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 900)],
    fontSize: 57,
    height: 1.14,
    letterSpacing: 0.0,
  );

  static final displayMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 800)],
    fontSize: 45,
    height: 1.16,
    letterSpacing: 0.0,
  );

  static final displaySmall = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 700)],
    fontSize: 36,
    height: 1.22,
    letterSpacing: 0.0,
  );

  static final headlineLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 900)],
    fontSize: 32,
    height: 1.25,
    letterSpacing: 0.0,
  );

  static final headlineMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 800)],
    fontSize: 28,
    height: 1.29,
    letterSpacing: 0.0,
  );

  static final headlineSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 700)],
    fontSize: 24,
    height: 1.33,
    letterSpacing: 0.0,
  );

  static final titleLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 900)],
    fontSize: 22,
    height: 1.27,
    letterSpacing: 0.0,
  );

  static final titleMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 800)],
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static final titleSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 700)],
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static final bodyLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 500)],
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static final bodyMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 500)],
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static final bodySmall = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 500)],
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static final labelLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 700)],
    fontSize: 12,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static final labelMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 700)],
    fontSize: 11,
    height: 1.33,
    letterSpacing: 0.3,
  );

  static final labelSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    color: _defaultTextColor,
    fontVariations: [FontVariation('wght', 700)],
    fontSize: 10,
    height: 1.45,
    letterSpacing: 0.5,
  );
}

// Reference Table for understanding common variation axis tags for variable fonts (opp. of static fonts) configuration
// | Axis   | Meaning      | Min->Max  |
// | ------ | ------------ | --------- |
// | `wght` | Weight       | 100 → 900 |
// | `wdth` | Width        | 75 → 125  |
// | `slnt` | Slant        | 0 → -10   |
// | `opsz` | Optical size | 8 → 144   |
// | `ital` | Optical size | 0 → 1     |
