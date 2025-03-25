import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/BottomNavigationControllerNurse.dart';
import 'package:project_after_update/modules/Nurse/Home/homeNurse.dart';
import 'package:project_after_update/modules/Nurse/Nurse_worl_after_today/Nurse_worl_after_today.dart';


import 'package:project_after_update/modules/Nurse/warehouse/addConsumer.dart';
class FancyNavBarNurse extends StatelessWidget {
  FancyNavBarNurse({Key? key}) : super(key: key);

  BottomNavigationControllerNurse bottomNavigationController =
  Get.put(BottomNavigationControllerNurse());

  final screens = [
    homeNurse(),
     addConsumerNurse(),
    Nurse_worl_after_today(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: bottomNavigationController.selectedIndex.value,
        children: screens,
      )),
      bottomNavigationBar: FancyBottomBar(
        items: [
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "المنزل",
            icon: Icon(Icons.home,color: Color(0xff9bb4fd)),
          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "المستودع",
            icon: Icon(Icons.medical_information_rounded,color: Color(0xff9bb4fd)),

          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "المهام",
            icon: Icon(Icons.file_copy_outlined,color: Color(0xff9bb4fd)),

          ),

        ],
        type: FancyType.FancyV2,
        onItemSelected: (index) {
          bottomNavigationController.changeIndex(index);
        },
        selectedIndex: bottomNavigationController.selectedIndex.value,
      ),
    );
  }
}