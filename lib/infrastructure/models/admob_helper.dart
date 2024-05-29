import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  InterstitialAd? _interstitialAd;
  int numOfAttemptLoad = 0;

  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5594344246097824/8945623431';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      return null;
    }
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5594344246097824/6151304672';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else {
      return null;
    }
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
    },
    onAdClosed: (Ad ad) => debugPrint('Ad Closed.'),
    onAdOpened: (Ad ad) => debugPrint('Ad Opened.'),
  );

  static BannerAd getBannerAd() {
    BannerAd myBanner = BannerAd(
      adUnitId: bannerAdUnitId!,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: bannerAdListener,
    );
    return myBanner;
  }

  void createInterAd() {
    InterstitialAd.load(
        adUnitId: interstitialAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            numOfAttemptLoad = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            numOfAttemptLoad++;
            _interstitialAd = null;

            if (numOfAttemptLoad < 3) {
              createInterAd();
            }
          },
        ));
  }

  void showInterAd() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          debugPrint('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterAd();
      },
      onAdImpression: (InterstitialAd ad) =>
          debugPrint('$ad impression occurred.'),
    );
    _interstitialAd!.show();

    _interstitialAd = null;
  }
}
