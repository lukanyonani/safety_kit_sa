import 'dart:io';

class AdsManager {
  static bool testAd = true;

  static String get intersitialAdID {
    if (testAd == true) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isAndroid) {
      return "ca-app-pub-8279863701405798/9095329531";
    } else {
      throw UnsupportedError("Un Supported");
    }
  }

  static String get bannerAdID {
    if (testAd == true) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isAndroid) {
      return "ca-app-pub-8279863701405798/3723691152";
    } else {
      throw UnsupportedError("Un Supported");
    }
  }
}
