import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'kg_theme_data.freezed.dart';
part 'kg_theme_data.g.dart';

enum ThemeColorTypes {
  primary,
  primaryDark,
  primaryContainer,
  primaryContainerDark,
  secondary,
  secondaryDark,
  secondaryContainer,
  tertiary,
  tertiaryContainer,
  background,
  backgroundDark,
  textColor,
  textColorDark,
}

extension Naming on ThemeColorTypes {
  String get name {
    switch (this) {
      case ThemeColorTypes.primary:
        return 'primary';
      case ThemeColorTypes.primaryDark:
        return 'primaryDark';
      case ThemeColorTypes.primaryContainer:
        return 'primaryContainer';
      case ThemeColorTypes.primaryContainerDark:
        return 'primaryContainerDark';
      case ThemeColorTypes.secondary:
        return 'secondary';
      case ThemeColorTypes.secondaryDark:
        return 'secondaryDark';
      case ThemeColorTypes.secondaryContainer:
        return 'secondaryContainer';
      case ThemeColorTypes.tertiary:
        return 'tertiary';
      case ThemeColorTypes.tertiaryContainer:
        return 'tertiaryContainer';
      case ThemeColorTypes.background:
        return 'background';
      case ThemeColorTypes.backgroundDark:
        return 'backgroundDark';
      case ThemeColorTypes.textColor:
        return 'textColor';
      case ThemeColorTypes.textColorDark:
        return 'textColorDark';
    }
  }
}

@freezed
class KgThemeData with _$KgThemeData {
  KgThemeData._();
  factory KgThemeData({
    @Default(false) bool isDark,
    @Default(8) double innerGapValue,
    @Default(8) double borderRadiusValue,
    @Default(10) double paddingValue,
    @Default(0xFFFFC211) int primaryValue,
    @Default(0xFF212121) int primaryDarkValue,
    @Default(0xFFFFFFFF) int primaryContainerValue,
    @Default(0xFF2E2E2E) int primaryContainerDarkValue,
    @Default(0xFF001F58) int secondaryValue,
    @Default(0xFFFFC64C) int secondaryDarkValue,
    @Default(0xFFFFD270) int secondaryContainerValue,
    @Default(0xFF5C5C95) int tertiaryValue,
    @Default(0xFFC8DBF8) int tertiaryContainerValue,
    @Default(0xFFFFF8F8) int backgroundValue,
    @Default(0xFF222222) int backgroundDarkValue,
    @Default(0xFF001F58) int textColorValue,
    @Default(0xFFFFFFFF) int textColorDarkValue,
  }) = _KgThemeData;

  Radius get borderRadius => Radius.circular(borderRadiusValue);
  Widget get innerGap => SizedBox(width: innerGapValue);
  EdgeInsets get padding => EdgeInsets.all(paddingValue);
  EdgeInsets get screenPadding => const EdgeInsets.symmetric(horizontal: 24);
  EdgeInsets get cardPadding =>
      const EdgeInsets.symmetric(horizontal: 12, vertical: 16);

  Color get primary => Color(primaryValue);
  Color get primaryDark => Color(primaryDarkValue);
  Color get primaryContainer => Color(primaryContainerValue);
  Color get primaryContainerDark => Color(primaryContainerDarkValue);
  Color get secondary => Color(secondaryValue);
  Color get secondaryDark => Color(secondaryDarkValue);
  Color get secondaryContainer => Color(secondaryContainerValue);
  Color get tertiary => Color(tertiaryValue);
  Color get tertiaryContainer => Color(tertiaryContainerValue);
  Color get background => Color(backgroundValue);
  Color get backgroundDark => Color(backgroundDarkValue);
  Color get textColor => Color(textColorValue);
  Color get textColorDark => Color(textColorDarkValue);

  BoxShadow get boxShadow => BoxShadow(
        color: isDark
            ? const Color.fromARGB(249, 47, 47, 47)
            : const Color.fromARGB(255, 186, 186, 186),
        blurRadius: 5,
        offset: const Offset(0, 5),
      );

  ThemeData light({FlexScheme? scheme}) {
    return FlexThemeData.light(
      fontFamily: 'Barlow',
      colors: customFlexScheme.light,
      scheme: scheme,
      background: background,
      textTheme: customTextTheme(isDark: false),
    );
  }

  ThemeData dark({FlexScheme? scheme}) {
    return FlexThemeData.dark(
      fontFamily: 'Barlow',
      colors: customFlexScheme.dark,
      scheme: scheme,
      background: backgroundDark,
      textTheme: customTextTheme(isDark: true),
    );
  }

  TextTheme customTextTheme({required bool isDark}) => TextTheme(
        headline1: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        headline2: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        headline3: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        headline4: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        headline5: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        headline6: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        bodyText1: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: isDark ? textColorDark : textColor,
        ),
        bodyText2: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: isDark ? textColorDark : textColor,
        ),
        subtitle1: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: isDark ? textColorDark : textColor,
        ),
        subtitle2: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: isDark ? textColorDark : textColor,
        ),
        button: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDark ? textColorDark : textColor,
        ),
        caption: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: isDark ? textColorDark : textColor,
        ),
        overline: TextStyle(
          letterSpacing: 0.02,
          fontFamily: 'Barlow',
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: isDark ? textColorDark : textColor,
        ),
      );

  FlexSchemeData get customFlexScheme => FlexSchemeData(
        name: 'Midnight blue',
        description: 'Midnight blue theme, custom definition of all colors',
        light: FlexSchemeColor(
          primary: primary,
          primaryContainer: primaryContainer,
          secondary: secondary,
          secondaryContainer: secondaryContainer,
          tertiary: tertiary,
          tertiaryContainer: tertiaryContainer,
        ),
        dark: FlexSchemeColor(
          primary: primaryDark,
          primaryContainer: primaryContainerDark,
          secondary: secondaryDark,
          secondaryContainer: secondaryContainer,
          tertiary: tertiary,
          tertiaryContainer: tertiaryContainer,
        ),
      );
  factory KgThemeData.fromJson(Map<String, dynamic> json) =>
      _$KgThemeDataFromJson(json);
}
