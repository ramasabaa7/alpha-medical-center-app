import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/reception/home/home_screen_reception_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Home_screen_reception extends StatelessWidget {
  const Home_screen_reception({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Home_screen_reception_controller());
    return GetBuilder<Home_screen_reception_controller>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          onPressed: () {
            Get.toNamed("/add_record");
          },
          child: Icon(Icons.add_circle_outline),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.changepage(1);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.medical_services_outlined,
                          color: controller.currentpage == 1
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        SizedBox(height: 5,),
                        Text("إضافة خدمة"),
                      ],
                    ),
                  ),

                  MaterialButton(
                    onPressed: () {
                      controller.changepage(3);
                    },
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: controller.currentpage == 3
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("طلب زيادة"),
                      ],
                    ),
                  ),
                  // MaterialButton(
                  //   onPressed: () {
                  //     controller.changepage(3);
                  //   },
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Icon(
                  //         Icons.money_rounded,
                  //         color: controller.currentpage == 3
                  //             ? StaticColor.primarycolor
                  //             : Colors.black,
                  //       ),
                  //       Text("فاتورة"),
                  //     ],
                  //   ),
                  // ),
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
