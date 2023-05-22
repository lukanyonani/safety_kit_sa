import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class EmergencyNumbers extends GetView<HomeController> {
  const EmergencyNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    var svgPolice = 'assets/icon/police.svg';
    String policeName = "Police";
    dynamic policeNumber = "10 111";
    //ambulance
    var svgAmbulance = 'assets/icon/ambulance.svg';
    String ambulanceName = "Ambulance";
    dynamic ambulanceNumber = "10 177";
    //Emergency
    var svgEmergency = 'assets/icon/em.svg';
    String emergencyName = "Emergency";
    dynamic emergencyNumber = "122";
    //Firebrigade
    var svgFirebrigade = 'assets/icon/fire.svg';
    String firebrigadeName = "Firebrigade";
    dynamic firebrigadeNumber = "10 177";
    //Lifeline
    var svgLifeLine = 'assets/icon/life.svg';
    String lifeLineName = "Life line";
    dynamic lifeLineNumber = "086 132 2322";
    //Childline
    var svgChildLine = 'assets/icon/child.svg';
    String childLineName = "Child line";
    dynamic childLineNumber = "080 005 5555";
    //callIcon
    var svgCall = 'assets/icon/call.svg';

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: ListView(scrollDirection: Axis.vertical, children: [
        const SizedBox(
          height: 16,
        ),
        //List items
        listItem(svgPolice, policeName, policeNumber, svgCall),
        listItem(svgAmbulance, ambulanceName, ambulanceNumber, svgCall),
        listItem(svgEmergency, emergencyName, emergencyNumber, svgCall),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: controller.bannerWidget(),
        ),
        listItem(svgFirebrigade, firebrigadeName, firebrigadeNumber, svgCall),
        listItem(svgLifeLine, lifeLineName, lifeLineNumber, svgCall),
        listItem(svgChildLine, childLineName, childLineNumber, svgCall),
        //the end
        const SizedBox(
          height: 40,
        ),
      ]),
    );
  }
}

Widget listItem(String icon, String name, number, String callIcon) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8, left: 12.0, right: 12.0),
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    elevation: 1,
    child: ListTile(
      contentPadding: const EdgeInsets.only(left: 14.0, right: 6.0),
      leading: SvgPicture.asset(icon),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        number,
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
          callIcon,
          fit: BoxFit.contain,
        ),
        onPressed: () => FlutterPhoneDirectCaller.callNumber(number),
      ),
    ),
  );
}
