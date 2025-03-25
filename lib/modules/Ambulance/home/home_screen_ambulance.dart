import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Ambulance/home/home_screen_ambulance_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Home_screen_ambulance extends StatelessWidget {
//  const Home_screen_ambulance({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(Home_screen_ambulance_controller());
    return GetBuilder<Home_screen_ambulance_controller>(builder: (controller) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings,size: 30,color: StaticColor.primarycolor,),
                  SizedBox(width: 5,),
                  Text("قائمة الإعدادات",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                ],
              ),
              Divider(),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  controller.logout();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.09,
                  decoration: BoxDecoration(
                      color:StaticColor.primarycolor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      Text("تسجيل الخروج",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          onPressed: () {
           // Get.toNamed("/add_record");
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
                          Icons.add_circle_outline,
                          color: controller.currentpage == 1
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("تسجيل حالة"),
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
                          Icons.medical_services_outlined,
                          color: controller.currentpage == 2
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("مستهلكات"),
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
                          Icons.settings,
                          color: controller.currentpage == 3
                              ? StaticColor.primarycolor
                              : Colors.black,
                        ),
                        Text("الإعدادات"),
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
