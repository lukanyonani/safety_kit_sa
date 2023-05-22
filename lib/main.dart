import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safety_kit_sa/views/home_view.dart';
import 'package:safety_kit_sa/views/profile_view.dart';
import 'package:safety_kit_sa/views/search_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'controllers/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //Ads
  MobileAds.instance.initialize();
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Safety Kit",
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final items = const [
    Icon(
      Icons.home,
      size: 30,
      color: Color(0xFFF1F1F1),
    ),
    Icon(
      Icons.search_rounded,
      size: 30,
      color: Color(0xFFF1F1F1),
    ),
    Icon(
      Icons.account_circle_rounded,
      size: 30,
      color: Color(0xFFF1F1F1),
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        color: const Color(0xFFEC3434),
        backgroundColor: const Color(0xFFF1F1F1),
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomeView();
        break;
      case 1:
        widget = const SearchView();
        break;
      default:
        widget = const ProfileView();
        break;
    }
    return widget;
  }
}
