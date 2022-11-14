import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_as_service_demo_site/modal/kg_theme_data.dart';

final themeModeStateProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final kgThemeDataStateProvider = StateProvider<KgThemeData>((ref) {
  return KgThemeData();
});

extension KgThemeDataExtension on ThemeData {
  KgThemeData get kgThemeData => KgThemeData();
}

class KgTheme extends StatefulWidget {
  const KgTheme({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<KgTheme> createState() => _KgThemeState();
}

class _KgThemeState extends State<KgTheme> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: widget.child,
    );
  }
}
