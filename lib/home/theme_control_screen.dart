import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_as_service_demo_site/kg_theme/kg_theme.dart';
import 'package:wallet_as_service_demo_site/modal/kg_theme_data.dart';

class ThemeControlScreen extends ConsumerStatefulWidget {
  const ThemeControlScreen({
    Key? key,
    required this.kgProvider,
    required this.colorType,
    this.isDark = false,
  }) : super(key: key);
  final StateController<KgThemeData> kgProvider;
  final ThemeColorTypes colorType;
  final bool isDark;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ThemeControlScreenState();
}

class _ThemeControlScreenState extends ConsumerState<ThemeControlScreen> {
  late Color pickerColor;

  @override
  void initState() {
    initColor();
    super.initState();
  }

  initColor() {
    switch (widget.colorType) {
      case ThemeColorTypes.primary:
        pickerColor = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.primaryDark
            : widget.kgProvider.state.primary;
        break;
      case ThemeColorTypes.primaryContainer:
        pickerColor = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.primaryContainerDark
            : widget.kgProvider.state.primaryContainer;
        break;
      case ThemeColorTypes.secondary:
        pickerColor = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.secondaryDark
            : widget.kgProvider.state.secondary;
        break;
      case ThemeColorTypes.background:
        pickerColor = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.backgroundDark
            : widget.kgProvider.state.background;
        break;
      case ThemeColorTypes.textColor:
        pickerColor = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.textColorDark
            : widget.kgProvider.state.textColor;
        break;

      default:
        pickerColor = widget.kgProvider.state.primary;
        break;
    }
  }

  void changeColor(Color color) {
    switch (widget.colorType) {
      case ThemeColorTypes.primary:
        widget.kgProvider.state = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.copyWith(primaryDarkValue: color.value)
            : widget.kgProvider.state.copyWith(primaryValue: color.value);
        break;
      case ThemeColorTypes.primaryContainer:
        widget.kgProvider.state = widget.kgProvider.state.isDark
            ? widget.kgProvider.state
                .copyWith(primaryContainerDarkValue: color.value)
            : widget.kgProvider.state
                .copyWith(primaryContainerValue: color.value);
        break;
      case ThemeColorTypes.secondary:
        widget.kgProvider.state = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.copyWith(secondaryDarkValue: color.value)
            : widget.kgProvider.state.copyWith(secondaryValue: color.value);
        break;
      case ThemeColorTypes.background:
        widget.kgProvider.state = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.copyWith(backgroundDarkValue: color.value)
            : widget.kgProvider.state.copyWith(backgroundValue: color.value);
        break;
      case ThemeColorTypes.textColor:
        widget.kgProvider.state = widget.kgProvider.state.isDark
            ? widget.kgProvider.state.copyWith(textColorDarkValue: color.value)
            : widget.kgProvider.state.copyWith(textColorValue: color.value);
        break;
      default:
        widget.kgProvider.state =
            widget.kgProvider.state.copyWith(primaryValue: color.value);
        break;
    }
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(kgThemeDataStateProvider.notifier);
    initColor();
    return Row(
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(widget.colorType.name,
              style: Theme.of(context).textTheme.headline5),
        ),
        GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.5),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: changeColor,
                        labelTypes: const [
                          ColorLabelType.hex,
                          ColorLabelType.rgb,
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [widget.kgProvider.state.boxShadow],
                color: pickerColor,
                borderRadius: BorderRadius.circular(8),
              ),
            )),
      ],
    );
  }
}
