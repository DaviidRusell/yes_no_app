import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdMob extends StatelessWidget {
  const BannerAdMob({
    super.key,
    required this.myBanner,
  });

  final BannerAd myBanner;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: myBanner.size.height.toDouble(),
      width: myBanner.size.width.toDouble(),
      child: AdWidget(
        ad: myBanner..load(),
      ),
    );
  }
}
