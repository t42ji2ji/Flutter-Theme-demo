import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_as_service_demo_site/home/mock_content.dart';
import 'package:wallet_as_service_demo_site/home/theme_control_screen.dart';

import 'home/mock_screen.dart';
import 'kg_theme/kg_theme.dart';
import 'modal/kg_theme_data.dart';

void main() {
  runApp(const KgTheme(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final kgThemeProvider = ref.watch(kgThemeDataStateProvider);
      return MaterialApp(
        title: 'Flutter Demo',
        theme: kgThemeProvider.light(),
        darkTheme: kgThemeProvider.dark(),
        themeMode: kgThemeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 10,
            child: ChangeThemeBtn(),
          ),
          Positioned(
            top: 100,
            left: 10,
            child: Consumer(
              builder: (context, ref, _) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(kgThemeDataStateProvider.notifier).state =
                              KgThemeData();
                        },
                        child: Icon(Icons.refresh,
                            color: ref
                                .watch(kgThemeDataStateProvider.notifier)
                                .state
                                .primary),
                      ),
                      ...[
                        ThemeColorTypes.primary,
                        ThemeColorTypes.primaryContainer,
                        ThemeColorTypes.secondary,
                        ThemeColorTypes.textColor,
                      ].map(
                        (type) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ThemeControlScreen(
                            colorType: type,
                            kgProvider:
                                ref.read(kgThemeDataStateProvider.notifier),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('BorderRadius',
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Slider(
                            max: 30,
                            inactiveColor: ref
                                .watch(kgThemeDataStateProvider.notifier)
                                .state
                                .primary
                                .withOpacity(0.5),
                            activeColor: ref
                                .watch(kgThemeDataStateProvider.notifier)
                                .state
                                .primary,
                            label: ref
                                .watch(kgThemeDataStateProvider)
                                .borderRadiusValue
                                .toString(),
                            value: ref
                                .watch(kgThemeDataStateProvider)
                                .borderRadiusValue,
                            onChanged: (value) {
                              final provider =
                                  ref.read(kgThemeDataStateProvider.notifier);
                              provider.state = provider.state.copyWith(
                                borderRadiusValue: value,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MockScreen(
                child: MockContent(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}