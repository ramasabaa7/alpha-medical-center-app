import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/reception/home/home_screen_reception_controller.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

import 'home_screen_store_controller.dart';



class Home_screen_store extends StatelessWidget {
  const Home_screen_store ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    warehouseControllerstor controllerstor = Get.find();
    Get.put(Home_screen_store_controller());
    return GetBuilder<Home_screen_store_controller>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          onPressed: () {
            controllerstor.Archive();
            Get.toNamed("/orders_from_warehouse");
          },
          child: Icon(Icons.receipt),
        ),

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.changepage(0);

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.home,
                          color: controller.currentpage == 0
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("الرئيسية"),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.changepage(1);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.medical_information_outlined,
                          color: controller.currentpage == 1
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("الطلبات"),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.changepage(2);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: controller.currentpage == 2
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("الحاجات"),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.changepage(3);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          color: controller.currentpage == 3
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("المهملات"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: controller.listpage.elementAt(controller.currentpage),
      );
    });
  }
}
