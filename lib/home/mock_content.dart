import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_as_service_demo_site/kg_theme/kg_theme.dart';

class MockContent extends StatelessWidget {
  const MockContent({Key? key}) : super(key: key);
  List<String> get allRpcImagePath => [
        "assets/mock/wallet/ethereum-wallet.svg",
        "assets/mock/wallet/polygon-wallet.svg",
        "assets/mock/wallet/arbitrum-wallet.svg",
        "assets/mock/wallet/solana_wallet.svg",
        "assets/mock/wallet/btc_wallet.svg",
        "assets/mock/wallet/bsc-wallet.svg",
        "assets/mock/wallet/tron_wallet.svg",
        "assets/mock/wallet/kcc-wallet.svg",
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.78 * 0.08,
                ),
                Padding(
                  padding: Theme.of(context).kgThemeData.screenPadding,
                  // padding: Theme.of(context).kgThemeData.screenPadding,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: CachedNetworkImageProvider(
                                  'https://miro.medium.com/max/1200/1*5AyYzOlGlv501PlJlIdZZQ.jpeg'),
                            )),
                        width: 30,
                        height: 30,
                      ),
                      Theme.of(context).kgThemeData.innerGap,
                      Text(
                        'Dorara',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.notifications_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$304',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: 36),
                      ),
                      const SizedBox(height: 20),
                      Consumer(builder: (context, ref, _) {
                        return Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          children: [
                            ...[
                              Icons.attach_money_rounded,
                              Icons.account_balance_wallet_rounded,
                              Icons.compare_arrows_rounded,
                            ]
                                .map(
                                  (data) => Column(
                                    children: [
                                      Container(
                                        padding: Theme.of(context)
                                            .kgThemeData
                                            .padding,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius: BorderRadius.all(
                                            ref
                                                .watch(kgThemeDataStateProvider)
                                                .borderRadius,
                                          ),
                                        ),
                                        child: Icon(
                                          data,
                                          size: 28,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Send',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                )
                                .toList()
                          ],
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
          Consumer(builder: (context, ref, _) {
            return Flexible(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.only(
                      topLeft: ref.watch(kgThemeDataStateProvider).borderRadius,
                      topRight:
                          ref.watch(kgThemeDataStateProvider).borderRadius),
                ),
                child: ListView.builder(
                  itemCount: 30,
                  padding: Theme.of(context).kgThemeData.screenPadding,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: Theme.of(context).kgThemeData.cardPadding,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            allRpcImagePath[index % allRpcImagePath.length],
                          ),
                          Theme.of(context).kgThemeData.innerGap,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Token Name$index',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Token Sub Name$index',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
