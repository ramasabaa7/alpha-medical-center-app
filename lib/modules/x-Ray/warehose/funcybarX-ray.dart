import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/Modules/x-Ray/warehose/BottomNAvigationControllerX-ray.dart';

import '../home/homeX-Ray.dart';
import '../home/homeX-RayController.dart';
import 'addConsumer.dart';
class FancyNavBarx_ray extends StatelessWidget {
  FancyNavBarx_ray({Key? key}) : super(key: key);
  BottomNavigationControllerx_ray bottomNavigationController =  Get.put(BottomNavigationControllerx_ray());

  final screens = [
    homex_ray(),
    AddConsumer()
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