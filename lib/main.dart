import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_as_service_demo_site/home/mock_content.dart';
import 'package:wallet_as_service_demo_site/home/theme_control_screen.dart';
import 'package:file_picker/file_picker.dart';

import 'home/mock_screen.dart';
import 'kg_theme/kg_theme.dart';
import 'modal/kg_theme_data.dart';

import 'dart:convert' show Utf8Decoder, utf8;

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show AnchorElement;

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
    return Consumer(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: ref.watch(kgThemeDataStateProvider).isDark
              ? const Color.fromARGB(255, 22, 22, 22)
              : Colors.white,
          body: Stack(
            children: [
              const Positioned(
                top: 10,
                right: 10,
                child: ChangeThemeBtn(),
              ),
              if (MediaQuery.of(context).size.width > 500)
                Positioned(
                    top: 100,
                    left: 10,
                    child: _buildThemeController(ref, context)),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    const MockScreen(
                      child: MockContent(),
                    ),
                    if (MediaQuery.of(context).size.width < 500)
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: _buildThemeController(ref, context),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeController(
    WidgetRef ref,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(kgThemeDataStateProvider.notifier).state = KgThemeData();
            },
            child: Icon(Icons.refresh,
                color:
                    ref.watch(kgThemeDataStateProvider.notifier).state.primary),
          ),
          ...[
            ThemeColorTypes.primary,
            ThemeColorTypes.primaryContainer,
            ThemeColorTypes.background,
            ThemeColorTypes.secondary,
            ThemeColorTypes.textColor,
          ].map(
            (type) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ThemeControlScreen(
                colorType: type,
                kgProvider: ref.read(kgThemeDataStateProvider.notifier),
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
                activeColor:
                    ref.watch(kgThemeDataStateProvider.notifier).state.primary,
                label: ref
                    .watch(kgThemeDataStateProvider)
                    .borderRadiusValue
                    .toString(),
                value: ref.watch(kgThemeDataStateProvider).borderRadiusValue,
                onChanged: (value) {
                  final provider = ref.read(kgThemeDataStateProvider.notifier);
                  provider.state = provider.state.copyWith(
                    borderRadiusValue: value,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['txt'],
                    );
                    if (picked != null) {
                      if (picked.files.first.bytes != null) {
                        final data = const Utf8Decoder()
                            .convert(picked.files.first.bytes!);
                        try {
                          List<String> str = data
                              .replaceAll("{", "")
                              .replaceAll("}", "")
                              .split(",");
                          Map<String, dynamic> result = {};
                          for (int i = 0; i < str.length; i++) {
                            List<String> s = str[i].split(":");
                            result.putIfAbsent(s[0].trim(), () => s[1].trim());
                          }
                          result.forEach((key, value) {
                            final number = double.tryParse(value);
                            if (number != null) {
                              result[key] = number;
                            }
                          });
                          final themeData = KgThemeData.fromJson(result);
                          ref.read(kgThemeDataStateProvider.notifier).state =
                              themeData;
                        } catch (e) {
                          print('=======error : $e=========');
                        }
                      }
                    }
                  },
                  child: Container(
                    padding: KgThemeData().padding,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.all(
                        ref.watch(kgThemeDataStateProvider).borderRadius,
                      ),
                    ),
                    child: Text(
                      'Import',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    void saveTextFile(String text, String filename) {
                      AnchorElement()
                        ..href =
                            '${Uri.dataFromString(text, mimeType: 'text/plain', encoding: utf8)}'
                        ..download = filename
                        ..style.display = 'none'
                        ..click();
                    }

                    final output = ref.read(kgThemeDataStateProvider).toJson();
                    output.remove('isDark');
                    saveTextFile(output.toString(), 'kg_theme_data');
                  },
                  child: Container(
                    padding: KgThemeData().padding,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.all(
                        ref.watch(kgThemeDataStateProvider).borderRadius,
                      ),
                    ),
                    child: Text(
                      'Export',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
