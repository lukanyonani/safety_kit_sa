import 'package:flutter/material.dart';
import 'package:safety_kit_sa/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:safety_kit_sa/widgets/em_contacts.dart';
import 'package:safety_kit_sa/widgets/em_numbers.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color(0xFFEC3434),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Safety Kit',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 24,
              ),
            )
          ],
        ),
        bottom: TabBar(
          labelStyle: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          indicatorColor: Colors.white,
          controller: controller.tabController,
          tabs: const [
            Tab(text: "Emergency Numbers"),
            Tab(text: "Emergency Contacts"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          //Numbers
          EmergencyNumbers(),
          //Contacts
          EmergencyContacts()
        ],
      ),
    );
  }
}
