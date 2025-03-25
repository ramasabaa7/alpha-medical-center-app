import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_details/ambulance_patient_details_controller.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_controller.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/ambulance_patient_visits_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Ambulance_patients_visits extends StatelessWidget {
  const Ambulance_patients_visits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Ambulance_Patient_visits_controller controller =
        Get.put(Ambulance_Patient_visits_controller());
    Ambulance_Patient_visits_details_controller
        ambulance_patient_visits_details_controller =
        Get.put(Ambulance_Patient_visits_details_controller());
    Ambulance_Patient_details_controller patient_details =Get.put(Ambulance_Patient_details_controller());
    return Scaffold(body:
        GetBuilder<Ambulance_Patient_visits_details_controller>(
            builder: (ambulance_patient_visits_details_controller) {
      return ambulance_patient_visits_details_controller.statusRequest ==
              StatusRequest.loading
          ? Center(
              child: CircularProgressIndicator(
                color: StaticColor.primarycolor,
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: const BoxDecoration(
                            color: StaticColor.primarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                      Positioned(
                        top: 90,
                        left: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child:
                              Image.asset("assets/images/patient_profile.png"),
                        ),
                      ),
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 60,
                              child: Image.asset(
                                "assets/images/information.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Text(
                              "زيارات المريض",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              border: Border(
                                bottom: BorderSide(
                                    color: StaticColor.primarycolor,
                                    width: 0.5),
                                left: BorderSide(
                                    color: StaticColor.primarycolor,
                                    width: 0.5),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await ambulance_patient_visits_details_controller
                                            .get_patient_visits_details(
                                                controller.data[index]['id']);
                                        print(
                                            "id foooooooooor visit is ${controller.data[index]['id']}");
                                        Get.toNamed(
                                            "/Ambulance_Patient_visits_details");
                                      },
                                      child: Container(
                                        child: Image.asset(
                                          "assets/images/info.png",
                                          fit: BoxFit.fill,
                                        ),
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed("/Edit_visit",arguments: {
                                          "id" :controller.data[index]['id'],
                                          "idpatientrecord":patient_details.data[0]['id']
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Image.asset(
                                          "assets/images/pen.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${controller.data[index]['created_at']}",
                                      style: TextStyle(
                                          color: StaticColor.primarycolor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
    }));
  }
}
