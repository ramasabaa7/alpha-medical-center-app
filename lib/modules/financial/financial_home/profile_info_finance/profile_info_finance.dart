import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/financial_home/profile_info_finance/profile_info_finance_controller.dart';
import 'package:project_after_update/modules/manager/home/profile_info_managment/profile_info_managment_controller.dart';
import 'package:project_after_update/modules/reception/home/profile_info/profile_info_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Profile_info_finance extends StatelessWidget {
  const Profile_info_finance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Profile_info_finance_controller controller = Get.put(Profile_info_finance_controller());
    return Scaffold(
        bottomNavigationBar:  GestureDetector(
          onTap: (){
            Get.offNamed("/EDit_profile_info_finance");
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: StaticColor.primarycolor
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit,size: 20,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("تعديل المعلومات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                ],),
            ),

          ),
        ),
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.start,
                "معلومات الملف الشخصي",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: GetBuilder<Profile_info_finance_controller>(builder: (controller) {
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)):
            SafeArea(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    color: StaticColor.primarycolor,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            left: 130,
                            top: 50,
                            child: CircleAvatar(
                              child: Image.asset(
                                  "assets/images/patient_profile.png"),
                              radius: 55,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "اسم المستخدم",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${controller.data_details[1]['name']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "البريد الالكتروني",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${controller.data_details[1]['email']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            " الراتب",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${controller.data_details[1]['salary']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "تاريخ الإنضمام",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${controller.data_details[1]['created_at']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "نوع العمل",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${controller.data_details[1]['type']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        }));
  }
}
