import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:safety_kit_sa/data/model/contact_model.dart';

import '../helpers/ads_manager.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final items = RxList<ContactModel>([]);
  //Ads
  late BannerAd _bannerAd;
  bool isBannerAdReady = false;

  InterstitialAd? _interstitialAd;
  //
  late TabController _tabController;

  // Initialize Get Storage instance
  final box = GetStorage();

  // add and remove items from the list
  void addItem(String name, String phone) {
    //items.add(ContactModel(name: name, phone: phone));
    // Update the data stored in Get Storage
    // Save contacts to Get Storage
    final contact = ContactModel(name: name, phone: phone);
    items.add(contact);

    box.write('items', items.toList());

    nameTextEditingController.clear();
    numberTextEditingController.clear();
  }

  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
    }
    box.write('items', items.toList());
  }

  //Text Editors
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();

  @override
  void onInit() {
    final storedItems = box.read<List<dynamic>>('items');
    if (storedItems != null) {
      items.addAll(storedItems
          .map((item) => ContactModel(
              name: item['name'] ?? '', phone: item['phone'] ?? ''))
          .toList());
    }
    // Listen for changes to the contacts list and update Get Storage accordingly
    ever(items, (_) => box.write('items', items.toList()));

    //Ads
    initAds();
    initBanner();
    loadAd();

    //TabBar
    _tabController = TabController(length: 2, vsync: this);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    final storage = GetStorage();
    storage.write(
        'items',
        items
            .map((item) => {
                  'name': item.name,
                  'phone': item.phone,
                })
            .toList());

    nameTextEditingController.dispose();
    numberTextEditingController.dispose();
    // Dispose the banner ad when the controller is closed
    _bannerAd.dispose();
    _tabController.dispose();
  }

  TabController get tabController => _tabController;

  //Ads
  Future<InitializationStatus> initAds() {
    return MobileAds.instance.initialize();
  }

  initBanner() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsManager.bannerAdID,
        listener: BannerAdListener(onAdLoaded: (ad) {
          isBannerAdReady = true;
          update();
        }, onAdFailedToLoad: (ad, error) {
          isBannerAdReady = false;
          //print('ad loading failed');
          update();
        }),
        request: const AdRequest());

    _bannerAd.load();
  }

  // Loads an interstitial ad.
  void loadAd() {
    InterstitialAd.load(
        adUnitId: AdsManager.intersitialAdID,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void showAd() {
    _interstitialAd?.show();
  }

  Widget bannerWidget() {
    return SizedBox(
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
      child: AdWidget(
        ad: _bannerAd,
      ),
    );
  }
}
