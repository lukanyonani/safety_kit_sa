import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:safety_kit_sa/data/model/contact_model.dart';

class EmergencyContacts extends GetView<HomeController> {
  const EmergencyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    //callIcon
    var svgCall = 'assets/icon/call.svg';
    //user
    var svgUser = 'assets/icon/user.svg';

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Obx(() => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.items.length + 1,
              itemBuilder: ((context, index) {
                if (index == controller.items.length) {
                  // This is the last item in the list, so add the button
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          //Opens Dailog
                          Get.defaultDialog(
                            title: "Add Contact",
                            titlePadding: const EdgeInsets.all(15.0),
                            content: contactDialog(),
                            textCancel: "Cancel",
                            textConfirm: "Add",
                            confirmTextColor: Colors.white,
                            cancelTextColor: const Color(0xFFEC3434),
                            buttonColor: const Color(0xFFEC3434),
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () {
                              controller.addItem(
                                  controller.nameTextEditingController.text,
                                  controller.numberTextEditingController.text);
                              Get.back();
                              controller.showAd();
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                            return const Color(0xFFEC3434);
                          }),
                        ),
                        //Button Icon
                        child: Container(
                          color: const Color(0xFFEC3434),
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10, bottom: 8),
                          child: const Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        )),
                  );
                } else if (index < controller.items.length) {
                  final contact = controller.items[index];
                  return contactCard(index, svgUser, contact, svgCall);
                } else {
                  return const SizedBox(
                    height: 120.0,
                  ); // empty container if item should not be shown
                }
              }),
            ),
          )),
    );
  }

  Dismissible contactCard(
      int index, String svgUser, ContactModel contact, String svgCall) {
    return Dismissible(
      background: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 22),
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        controller.removeItem(index);
      },
      key: UniqueKey(),
      //Card Widget
      child: Card(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
        color: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 1,

        //The Contact Tile
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 14.0, right: 6.0),
          leading: SvgPicture.asset(svgUser),
          title: Text(
            contact.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            contact.phone,
            style: const TextStyle(
                color: Color(0xFFEC3434),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          trailing: IconButton(
            alignment: Alignment.centerRight,
            splashRadius: 40,
            iconSize: 48,
            icon: SvgPicture.asset(
              svgCall,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              FlutterPhoneDirectCaller.callNumber(contact.phone);
            },
          ),
        ),
      ),
    );
  }

  Widget contactDialog() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller.nameTextEditingController,
            decoration: const InputDecoration(
                fillColor: Color(0xFFEC3434),
                labelText: 'Name',
                hintText: 'Name',
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller.numberTextEditingController,
            decoration: const InputDecoration(
                labelText: 'Number',
                hintText: 'Number',
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
