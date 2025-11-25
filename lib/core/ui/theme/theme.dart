import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class NIMSTheme {
  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: NIMSColors.green02,
      primary: NIMSColors.green02,
      secondary: NIMSColors.green02,
      error: NIMSColors.red02,
      brightness: Brightness.light,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: _buttonTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: NIMSColors.green02,
      primary: NIMSColors.green02,
      secondary: NIMSColors.green02,
      error: NIMSColors.red02,
      brightness: Brightness.dark,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      fillColor: Colors.grey[900],
    ),
    elevatedButtonTheme: _buttonTheme,
  );

  /*
  Shared Theme configurations
  */
  static final TextTheme _textTheme = TextTheme(
    displayLarge: NIMSTextStyles.displayLarge,
    displayMedium: NIMSTextStyles.displayMedium,
    displaySmall: NIMSTextStyles.displaySmall,

    headlineLarge: NIMSTextStyles.headlineLarge,
    headlineMedium: NIMSTextStyles.headlineMedium,
    headlineSmall: NIMSTextStyles.headlineSmall,

    titleLarge: NIMSTextStyles.titleLarge,
    titleMedium: NIMSTextStyles.titleMedium,
    titleSmall: NIMSTextStyles.titleSmall,

    bodyLarge: NIMSTextStyles.bodyLarge,
    bodyMedium: NIMSTextStyles.bodyMedium,
    bodySmall: NIMSTextStyles.bodySmall,

    labelLarge: NIMSTextStyles.labelLarge,
    labelMedium: NIMSTextStyles.labelMedium,
    labelSmall: NIMSTextStyles.labelSmall,
  );

  /// Input Decoration Theme
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
        filled: true,
        fillColor: NIMSColors.grey01,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: NIMSTextStyles.bodyMedium,
      );

  /// Elevated Button Theme
  static final ElevatedButtonThemeData _buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: NIMSColors.green02,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: NIMSTextStyles.bodyLarge,
    ),
  );
}
