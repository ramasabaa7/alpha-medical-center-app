import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/manager/home/home_screen_manager_controller.dart';
import 'package:project_after_update/modules/reception/home/home_screen_reception_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Setting_managment extends StatelessWidget {
  const Setting_managment({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Get.put(Home_screen_manager_controller());
    return GetBuilder<Home_screen_manager_controller>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
          title:   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings,size: 30,color:Colors.white,),
              SizedBox(width: 5,),
              Text("قائمة الإعدادات",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: ListView(
              children: [
                CircleAvatar(child: Image.asset("assets/images/patient_profile.png",),radius: 50,),
                Divider(),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    controller.logout();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.09,
                    decoration: BoxDecoration(
                        color:StaticColor.primarycolor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.login_outlined,color: Colors.white,),
                        Text("تسجيل الخروج",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed("/Profile_info_managment");
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.09,
                    decoration: BoxDecoration(
                        color:StaticColor.primarycolor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person_pin_rounded,color: Colors.white,),
                        Text("المعلومات الشخصية",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
