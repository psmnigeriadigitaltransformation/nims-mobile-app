import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class NIMSTheme {
  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: NIMSColors.green05,
      primary: NIMSColors.green05,
      inversePrimary: NIMSColors.green01,
      secondary: NIMSColors.grey05,
      error: NIMSColors.red05,
      brightness: Brightness.light,
      tertiary: NIMSColors.grey07,
      tertiaryContainer: NIMSColors.grey01,
      outline: NIMSColors.grey03,
      surface: NIMSColors.white,
      errorContainer: NIMSColors.red01,
    ),
    splashColor: NIMSColors.grey01,
    dividerColor: NIMSColors.grey03,
    hintColor: NIMSColors.grey05,
    highlightColor: NIMSColors.grey01,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _buttonTheme,
    searchBarTheme: _searchBarTheme,
    dropdownMenuTheme: _dropdownMenuTheme,
    scrollbarTheme: _scrollBarTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: NIMSColors.green05,
      primary: NIMSColors.green05,
      inversePrimary: NIMSColors.green01,
      secondary: NIMSColors.grey05,
      error: NIMSColors.red05,
      brightness: Brightness.light,
      tertiary: NIMSColors.grey07,
      tertiaryContainer: NIMSColors.grey01,
      outline: NIMSColors.grey03,
      surface: NIMSColors.white,
      errorContainer: NIMSColors.red01,
    ),
    splashColor: NIMSColors.grey01,
    dividerColor: NIMSColors.grey03,
    hintColor: NIMSColors.grey05,
    highlightColor: NIMSColors.grey01,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _buttonTheme,
    searchBarTheme: _searchBarTheme,
    dropdownMenuTheme: _dropdownMenuTheme,
    scrollbarTheme: _scrollBarTheme,
  );

  static final _scrollBarTheme = ScrollbarThemeData(
    thumbVisibility: const WidgetStatePropertyAll(false),
    trackVisibility: const WidgetStatePropertyAll(false),
    thickness: const WidgetStatePropertyAll(2),
    radius: const Radius.circular(0),
    thumbColor: WidgetStatePropertyAll(NIMSColors.green03),
    trackColor: WidgetStatePropertyAll(NIMSColors.green01),
    trackBorderColor: WidgetStatePropertyAll(NIMSColors.green01),
    crossAxisMargin: 0,
    mainAxisMargin: 0,
    minThumbLength: 0,
    interactive: true,
  );

  static final _dropdownMenuTheme = DropdownMenuThemeData(
    textStyle: NIMSTextStyles.bodyMedium.copyWith(color: NIMSColors.grey07),
    inputDecorationTheme: _inputDecorationTheme,
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(NIMSColors.white),
      shadowColor: WidgetStatePropertyAll(NIMSColors.transparent),
      surfaceTintColor: WidgetStatePropertyAll(NIMSColors.white),
      elevation: const WidgetStatePropertyAll(0),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      ),
      minimumSize: const WidgetStatePropertyAll(Size(48, 40)),
      fixedSize: null,
      maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 190)),
      side: WidgetStatePropertyAll(
        BorderSide(color: NIMSColors.grey03, width: 0.5),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
      visualDensity: VisualDensity.standard,
      alignment: Alignment.bottomLeft,
    ),
    disabledColor: NIMSColors.grey01,
  );

  /// Text Theme
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

  /// Search Bar Theme
  static final _searchBarTheme = SearchBarThemeData(
    elevation: WidgetStateProperty.all(0),
    backgroundColor: WidgetStateProperty.all(NIMSColors.grey01),
    shadowColor: WidgetStateProperty.all(NIMSColors.transparent),
    surfaceTintColor: WidgetStateProperty.all(NIMSColors.transparent),
    overlayColor: WidgetStateProperty.all(NIMSColors.transparent),
    side: WidgetStateProperty.all(
      BorderSide(color: NIMSColors.grey03, width: 0.5),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    textStyle: WidgetStateProperty.all(
      NIMSTextStyles.bodyMedium.copyWith(color: NIMSColors.grey07),
    ),
    hintStyle: WidgetStateProperty.all(
      NIMSTextStyles.bodySmall.copyWith(color: NIMSColors.grey05),
    ),
    constraints: const BoxConstraints(minHeight: 48, maxHeight: 52),
    textCapitalization: TextCapitalization.none,
  );

  /// Input Decoration Theme
  static final _inputDecorationTheme = InputDecorationTheme(
    labelStyle: NIMSTextStyles.bodySmall.copyWith(color: NIMSColors.grey05),
    floatingLabelStyle: NIMSTextStyles.labelLarge.copyWith(
      color: NIMSColors.green05,
    ),
    helperStyle: NIMSTextStyles.bodySmall.copyWith(color: NIMSColors.grey06),
    helperMaxLines: NIMSThemeTokens.inputDecorationThemeHelperMaxLines,
    hintStyle: NIMSTextStyles.bodySmall.copyWith(color: NIMSColors.grey05),
    hintFadeDuration: const Duration(
      milliseconds:
          NIMSThemeTokens.inputDecorationThemeHintFadeDurationMilliseconds,
    ),
    hintMaxLines: NIMSThemeTokens.inputDecorationThemeHintMaxLines,
    errorStyle: NIMSTextStyles.bodySmall.copyWith(color: NIMSColors.red05),
    errorMaxLines: NIMSThemeTokens.inputDecorationThemeErrorMaxLines,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    isDense: false,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: NIMSThemeTokens.inputDecorationThemeContentPaddingHorizontal,
      vertical: NIMSThemeTokens.inputDecorationThemeContentPaddingVertical,
    ),
    isCollapsed: false,
    iconColor: NIMSColors.green05,
    prefixStyle: NIMSTextStyles.bodyMedium.copyWith(color: NIMSColors.grey07),
    prefixIconColor: NIMSColors.grey07,
    prefixIconConstraints: const BoxConstraints(
      minHeight: NIMSThemeTokens
          .inputDecorationThemeContentPrefixIconConstraintsMinHeight,
      minWidth: NIMSThemeTokens
          .inputDecorationThemeContentPrefixIconConstraintsMinWidth,
    ),
    suffixStyle: NIMSTextStyles.bodyMedium.copyWith(color: NIMSColors.grey07),
    suffixIconColor: NIMSColors.grey06,
    suffixIconConstraints: const BoxConstraints(
      minHeight: NIMSThemeTokens
          .inputDecorationThemeContentSuffixIconConstraintsMinHeight,
      minWidth: NIMSThemeTokens
          .inputDecorationThemeContentSuffixIconConstraintsMinWidth,
    ),
    counterStyle: NIMSTextStyles.bodySmall.copyWith(color: NIMSColors.grey07),
    filled: true,
    fillColor: NIMSColors.grey01,
    activeIndicatorBorder: const BorderSide(
      color: NIMSColors.green07,
      width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
      strokeAlign: BorderSide.strokeAlignOutside,
    ),
    focusColor: NIMSColors.green07,
    hoverColor: NIMSColors.grey02,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        NIMSThemeTokens.inputDecorationThemeBorderRadius,
      ),
      borderSide: const BorderSide(
        color: NIMSColors.grey03,
        width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        NIMSThemeTokens.inputDecorationThemeBorderRadius,
      ),
      borderSide: const BorderSide(
        color: NIMSColors.grey03,
        width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        NIMSThemeTokens.inputDecorationThemeBorderRadius,
      ),
      borderSide: const BorderSide(
        color: NIMSColors.green05,
        width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        NIMSThemeTokens.inputDecorationThemeBorderRadius,
      ),
      borderSide: const BorderSide(
        color: NIMSColors.grey03,
        width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        NIMSThemeTokens.inputDecorationThemeBorderRadius,
      ),
      borderSide: const BorderSide(
        color: NIMSColors.red03,
        width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        NIMSThemeTokens.inputDecorationThemeBorderRadius,
      ),
      borderSide: const BorderSide(
        color: NIMSColors.red05,
        width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
      ),
    ),
    outlineBorder: const BorderSide(
      color: NIMSColors.grey03,
      width: NIMSThemeTokens.inputDecorationThemeBorderWidth,
    ),
    alignLabelWithHint: false,
    constraints: const BoxConstraints(
      minHeight: NIMSThemeTokens.inputDecorationThemeConstraintMinHeight,
    ),
    visualDensity: VisualDensity.standard,
    data: null,
    child: null,
  );

  static final FilledButtonThemeData _buttonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: NIMSThemeTokens.filledButtonThemeElevation,
      backgroundColor: NIMSColors.green05,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(
        vertical: NIMSThemeTokens.filledButtonPaddingVertical,
      ),
      textStyle: NIMSTextStyles.labelLarge,
      enableFeedback: false,
    ),
  );
}

class NIMSThemeTokens {
  static const inputDecorationThemeBorderWidth = 1.0;
  static const inputDecorationThemeConstraintMinHeight = 56.0;
  static const inputDecorationThemeHelperMaxLines = 2;
  static const inputDecorationThemeHintMaxLines = 1;
  static const inputDecorationThemeErrorMaxLines = 2;
  static const inputDecorationThemeContentPaddingHorizontal = 16.0;
  static const inputDecorationThemeContentPaddingVertical = 20.0;
  static const inputDecorationThemeContentPrefixIconConstraintsMinHeight = 24.0;
  static const inputDecorationThemeContentPrefixIconConstraintsMinWidth = 24.0;
  static const inputDecorationThemeContentSuffixIconConstraintsMinHeight = 24.0;
  static const inputDecorationThemeContentSuffixIconConstraintsMinWidth = 24.0;
  static const inputDecorationThemeBorderRadius = 12.0;
  static const inputDecorationThemeHintFadeDurationMilliseconds = 200;

  static const filledButtonThemeElevation = 0.0;
  static const filledButtonPaddingVertical = 16.0;
}
