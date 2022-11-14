import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:wallet_as_service_demo_site/kg_theme/kg_theme.dart';

class MockScreen extends StatelessWidget {
  const MockScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          children: [
            Text(
              'KG Theme',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18.5,
                      horizontal: 23,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: child,
                    ),
                  ),
                ),
                IgnorePointer(
                  child: SizedBox(
                      width: 439,
                      height: 893,
                      child: SvgPicture.asset('assets/mock/iphone_14_pro.svg')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeThemeBtn extends ConsumerStatefulWidget {
  const ChangeThemeBtn({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeThemeBtnState();
}

class _ChangeThemeBtnState extends ConsumerState<ChangeThemeBtn> {
  var control = CustomAnimationControl.play; // state variable

  void toggleDirection() {
    setState(() {
      control = control == CustomAnimationControl.play
          ? CustomAnimationControl.playReverse
          : CustomAnimationControl.play;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 0.8,
          child: Switch.adaptive(
            activeColor: Theme.of(context).primaryColor,
            value: ref.watch(kgThemeDataStateProvider).isDark,
            onChanged: (value) {
              toggleDirection();
              final kgThemeProvider =
                  ref.read(kgThemeDataStateProvider.notifier);
              kgThemeProvider.state = kgThemeProvider.state.copyWith(
                isDark: value,
              );
            },
          ),
        ),
        CustomAnimation<double>(
          tween: 0.7.tweenTo(1),
          builder: (context, _, value) {
            return Transform.rotate(
              angle: value * 2 * 3.14,
              child: Icon(
                Theme.of(context).brightness == Brightness.light
                    ? Icons.wb_sunny
                    : Icons.dark_mode_rounded,
              ),
            );
          },
        ),
      ],
    );
  }
}
