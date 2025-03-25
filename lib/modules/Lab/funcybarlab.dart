import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BottomNAvigationControllerlab.dart';
import 'Warehose/addConsumer.dart';
import 'home/homelab.dart';



//import 'addConsumer.dart';
class FancyNavBarlab extends StatelessWidget {
  FancyNavBarlab({Key? key}) : super(key: key);

  BottomNavigationControllerlab bottomNavigationController =
  Get.put(BottomNavigationControllerlab());

  final screens = [
    homelab(),
    addConsumerlab ()
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