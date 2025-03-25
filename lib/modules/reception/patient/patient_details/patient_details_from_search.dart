import 'package:flutter/material.dart';
import 'package:project_after_update/modules/reception/home/home_reception_controller.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_controller.dart';
import 'package:project_after_update/modules/reception/patient/patient_visits/patient_visits_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';
class Patient_details_from_search extends StatelessWidget {
  const Patient_details_from_search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Home_reception_controller controller =Get.put(Home_reception_controller());
    return RefreshIndicator(
      onRefresh:()async{
        await controller.get_previous_medical()
        ;
      } ,
      child: Scaffold(
        // bottomNavigationBar:  GestureDetector(
        //   onTap: (){
        //     Get.toNamed("/patient_services",arguments: {
        //       "name":controller.data_details[0]['FullName'],
        //       "id_patient_record":controller.data_details[0]['id']
        //
        //     });
        //   },
        //   child: Container(
        //     height: MediaQuery.of(context).size.height*0.08,
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     decoration:  BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        //     child:  Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Container(
        //           height: 50,
        //           width: 50,
        //           child: Image.asset(
        //             "assets/images/assistance.png",
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //         const Text(
        //           "خدمات المريض",
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
        //         ),
        //
        //       ],
        //     ),
        //
        //   ),
        // ),
        body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: StaticColor.primarycolor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Positioned(
                  top: 50,
                  left: 130,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.asset("assets/images/patient_profile.png"),
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   left: 30,
                //   child: Container(
                //     padding: const EdgeInsets.all(5),
                //     height: 80,
                //     width: 90,
                //     decoration: BoxDecoration(
                //         color: Colors.white.withAlpha(80),
                //         borderRadius: const BorderRadius.only(
                //             topRight: Radius.circular(10),
                //             topLeft: Radius.circular(10))),
                //     child: Column(
                //       children: [
                //         Expanded(
                //           child: Image.asset("assets/images/document.png"),
                //           flex: 2,
                //         ),
                //         const Expanded(
                //             child: Text(
                //           "السجل الطبي",
                //           style: TextStyle(
                //               color: Colors.white, fontWeight: FontWeight.bold),
                //         ))
                //       ],
                //     ),
                //   ),
                // ),
                // Positioned(
                //   top: 10,
                //   left: 30,
                //   child: GestureDetector(
                //     onTap: (){
                //       Get.toNamed("/Reception_visit_registration",arguments: {
                //         "IDPatientRecord":controller.data_details[0]['id'],
                //         "title" : controller.data_details[0]['FullName']
                //       });
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.all(5),
                //       height: 80,
                //       width: 90,
                //       decoration: BoxDecoration(
                //           color: Colors.white.withAlpha(80),
                //           borderRadius: const BorderRadius.only(
                //               topRight: Radius.circular(10),
                //               topLeft: Radius.circular(10))),
                //       child: Column(
                //         children: [
                //           Expanded(
                //             child: Image.asset("assets/images/transmission.png"),
                //             flex: 2,
                //           ),
                //           const Expanded(
                //               child: Text(
                //                 "طلب تحويل",
                //                 style: TextStyle(
                //                     color: Colors.white, fontWeight: FontWeight.bold),
                //               ))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   top: 10,
                //   left: 250,
                //   child: GestureDetector(
                //     onTap: ()async {
                //       print("from patient details the id is ${controller.data_details[0]['id']}");
                //       await patient_visits_controller.get_patient_visits(controller.data_details[0]['id']);
                //       Get.toNamed("/patient_visits");
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.all(5),
                //       height: 80,
                //       width: 90,
                //       decoration: BoxDecoration(
                //           color: Colors.white.withAlpha(80),
                //           borderRadius: const BorderRadius.only(
                //               topRight: Radius.circular(10),
                //               topLeft: Radius.circular(10))),
                //       child: Column(
                //         children: [
                //           Expanded(
                //             child: Image.asset("assets/images/information.png"),
                //             flex: 2,
                //           ),
                //           const Expanded(
                //               child: Text(
                //                 "سجل الزيارات",
                //                 style: TextStyle(
                //                     color: Colors.white, fontWeight: FontWeight.bold),
                //               ))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "بيانات المريض",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        child: Image.asset(
                          "assets/images/patient_details.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        "قسم الإستقبال",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(
                    height:3,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            GetBuilder<Home_reception_controller>(builder: (controller){
              return
                controller.data_details_2.isEmpty?Container(
                  child: Center(
                    child:Text("لا يوجد بيانات لعرضها",style: TextStyle(fontSize: 15,color: StaticColor.primarycolor),),
                  ),
                ):
                Container(
                  height: MediaQuery.of(context).size.height*0.65,
                  padding: const EdgeInsets.all(8),
                  child:
                  ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text(controller.data_details[0]['FullName']),
                            Text(" : المريض",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.person,
                              color: StaticColor.primarycolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text("${controller.data_details[0]['IDPersonal']}  :"),
                            Text("الرقم الوطني ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.credit_card_rounded,
                              color: StaticColor.primarycolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text("${controller.data_details[0]['age']}  :"),
                            Text("العمر",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.person_pin_rounded,
                              color: StaticColor.primarycolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text("${controller.data_details[0]['address']}  :"),
                            Text("العنوان",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.location_on,
                              color: StaticColor.primarycolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text("${controller.data_details[0]['phonenumber']}  :"),
                            Text("رقم الهاتف",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.phone,
                              color: StaticColor.primarycolor,
                            )
                          ],
                        ),

                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            // IconButton(onPressed:(){
                            //   print("id for previous medical is${controller.data_details_2[0]['id']} and patient record is ${controller.data_details_2[0]['IDPatientRecord']}");
                            //   Get.toNamed("/Edit_Previous_medical_cond",arguments: {
                            //     "id" : controller.data_details_2[0]['id'],
                            //     "patientrecord" : controller.data_details_2[0]['IDPatientRecord']
                            //   });
                            // }, icon: Icon(Icons.edit),color:StaticColor.primarycolor,),
                            Container(
                              child: Row(
                                children: [
                                  Text("${controller.data_details_2[0]['DiseaseName']}  :"),
                                  Text("السوابق المرضية",
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  Icon(
                                    Icons.medication,
                                    color: StaticColor.primarycolor,
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),

                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: StaticColor.thirdgrey.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text("${controller.data_details_2[0]['Details']}  :"),
                            Text("تفاصيل السوابق",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.medical_services_rounded,
                              color: StaticColor.primarycolor,
                            )
                          ],
                        ),

                      ),
                    ],
                  ),
                );
            })

          ],
        ),
      ),
    );
  }
}


