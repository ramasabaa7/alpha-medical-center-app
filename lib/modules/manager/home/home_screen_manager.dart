import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/customer/manager/custom_drawer/custom_drawer.dart';
import 'package:project_after_update/modules/manager/home/home_screen_manager_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Home_screen_manager extends StatelessWidget {
  const Home_screen_manager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Home_screen_manager_controller());
    return GetBuilder<Home_screen_manager_controller>(builder: (controller) {
      return Scaffold(
        // drawer: Drawer(
        //   child: Custom_Drawer(),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Center(
            child: Container(
                height: 40,
                child: Image.asset(
                  "assets/images/salary.png",
                  fit: BoxFit.fill,
                )),
          ),
          backgroundColor: StaticColor.primarycolor,
          onPressed: () {
            Get.toNamed("/Salary_increase");
          },
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
                      controller.changepage(1);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_task_outlined,
                          color: controller.currentpage == 1
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("الطلبات"),
                      ],
                    ),
                  ),
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
                          Icons.settings,
                          color: controller.currentpage == 2
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("الإعدادات"),
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
                          Icons.add_circle_outline,
                          color: controller.currentpage == 3
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("قسم جديد"),
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
