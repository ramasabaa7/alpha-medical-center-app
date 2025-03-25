import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/Nurse_visit_ditails/Nurse_visit_ditailsController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:http/http.dart' as http;

class Nurse_visit_ditails extends StatelessWidget {

  final String imageUrl='https://ultimatebyteos.com/uploads/20230630140957_Doctors_analyzing_patients_disease_history-removebg-preview';

  Nurse_visit_ditailsController controller =Get.put(Nurse_visit_ditailsController());

  @override
  Widget build(BuildContext context) {
    Widget xRayContainer;
    if (controller.data[0]['x_ray'] != null && controller.data[0]['x_ray'].length > 0) {
      xRayContainer = Container(
        height: 500,
        child: ListView.builder(
          itemCount: controller.data[0]['x_ray'].length,
          itemBuilder: (context, index) {
            final imageName = controller.data[0]['x_ray'][index]['NameIMG'];
            final imageId = controller.data[0]['x_ray'][index]['id'];
            print(imageId);
            return ListTile(
              title: Text(imageName),
              trailing: ElevatedButton(
                onPressed: () async {
                  // controller.download_x(imageId);
                },
                child: Text('Download'),
              ),
            );
          },
        ),
      );
    } else {
      xRayContainer = Text('No x-ray images available.');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black54,size: 28),
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Expanded(
              child: Text(
                'تفاصيل الزيارة',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25, color: Colors.black54),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(children: [


          Container(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [


                const Text(
                  "اسم الطبيب",
                  style: TextStyle(fontSize: 20,color: Colors.black54, ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['Title']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "الضغط",
                  style: TextStyle(fontSize: 20,color: Colors.black54,),
                ),
                Center(
                  child: Container(

                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['Pressure']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "النبض",
                  style: TextStyle(fontSize: 20,color: Colors.black54,),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['Heartbeat']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "الحرارة",
                  style: TextStyle(fontSize: 20,color: Colors.black54,),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['BodyHeat']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "القصة السريرية",
                  style: TextStyle(fontSize: 20,color: Colors.black54,),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color:Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['ClinicalStory']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),

                  ),

                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "الفحص السريري",
                  style: TextStyle(fontSize: 20,color: Colors.black54,),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color:Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['ClinicalExamination']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),

                  ),

                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "الملاحظات",
                  style: TextStyle(fontSize: 20,color: Colors.black54,),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.all(8),
                    height: Get.height * 0.05,
                    width: Get.width * 0.83,
                    decoration: BoxDecoration(
                      color:Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "${controller.data[0]['Comments']}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black45),
                      textAlign: TextAlign.end,
                    ),

                  ),

                ),
                const Divider(
                  endIndent:18,
                  indent: 18,
                  height: 0,
                  thickness: 1.7,
                  color: Color(0xff9bb4fd),
                ),
                const SizedBox(
                  height: 20,
                ),
                xRayContainer,


      SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.go_to_edit();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: StaticColor.primarycolor,
                        ),
                        child: Center(child: Text("تعديل ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.defaultDialog(
                          title: "هل تريد حذف تفاصيل المعاينة",
                          content:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.delete_patient_visits_details(controller.data[0]['id']);

                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: StaticColor.primarycolor,
                                  ),
                                  child: Center(child: Text("نعم ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: StaticColor.primarycolor,
                                  ),
                                  child: Center(child: Text("لا ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: StaticColor.primarycolor,
                        ),
                        child: Center(child: Text("حذف ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ),
                    ),
                  ],
                ),
              ],

            ),
          ),
        ]),
      ),
    );

  }





}
