import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_details/ambulance_patient_details_controller.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Ambulance_patients_details extends StatelessWidget {
  const Ambulance_patients_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Ambulance_Patient_details_controller controller =Get.put(Ambulance_Patient_details_controller());
    Ambulance_Patient_visits_controller ambulance_patient_visits_controller =Get.put(Ambulance_Patient_visits_controller());
    return
      Scaffold(
      body: SafeArea(
        child: GetBuilder<Ambulance_Patient_visits_controller>(builder: (ambulance_patient_visits_controller){
          return
            ambulance_patient_visits_controller.statusRequest == StatusRequest.loading ?

                  Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),) :
              ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: const BoxDecoration(
                            color: StaticColor.primarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                      Positioned(
                        top: 140,
                        left: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Image.asset("assets/images/patient_profile.png"),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 30,
                        child: GestureDetector(
                          onTap: () async{
                           await ambulance_patient_visits_controller.get_patient_visits(controller.data[0]['id']);
                           Get.toNamed("/Ambulance_patients_visits");


                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            height: 80,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(80),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset("assets/images/information.png"),
                                  flex: 2,
                                ),
                                const Expanded(
                                    child: Text(
                                      "سجل الزيارات",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 250,
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed("/Convert_request_in_ambulance");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            height: 80,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(80),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset("assets/images/transmission.png"),
                                  flex: 2,
                                ),
                                const Expanded(
                                    child: Text(
                                      "طلب تحويل",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 10,
                      //   left: 250,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Get.toNamed("/add_result",arguments: {
                      //         "id" : controller.data[0]['id']
                      //       });
                      //       print("theeeee id of patient  from details page is ${controller.data[0]['id']} ");
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
                      //             child: Image.asset("assets/images/medical-test.png"),
                      //             flex: 2,
                      //           ),
                      //           const Expanded(
                      //               child: Text(
                      //                 "إرفاق نتيجة",
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
                          "قسم الإسعاف",
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
                              "بيانات المريض",
                              style: TextStyle(fontSize:15, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 5,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.4,
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
                              Text(controller.data[0]['FullName']),
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
                              Text("${controller.data[0]['IDPersonal']}  :"),
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
                              Text("${controller.data[0]['age']}  :"),
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
                              Text("${controller.data[0]['address']}  :"),
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
                              Text("${controller.data[0]['phonenumber']}  :"),
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
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Expanded(flex: 1,child: Container()),
                     Expanded(
                       flex: 2,
                       child: GestureDetector(
                         onTap: (){
                           Get.toNamed("/Ambulance_visit_registration",arguments: {
                             "IDPatientRecord" :controller.data[0]['id'],
                             "title" : controller.data[0]['FullName']
                           });
                         },
                         child: Container(
                           height: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(25),
                             color: StaticColor.primarycolor
                           ),
                           child: Row(

                             children: [
                                  Container(
                                   height:35 ,
                                   width: 35,
                                   child: Image.asset("assets/images/pen.png"),
                                 ),

                               SizedBox(width: 5,),
                               Text("تسجيل زيارة",style: TextStyle(color: Colors.white,fontSize: 20),)
                             ],
                           ),
                         ),
                       ),
                     ),
                     Expanded(flex: 1,child: Container()),
                   ],
                 ),
                ],
              );
        }),
      )
    );
  }
}
