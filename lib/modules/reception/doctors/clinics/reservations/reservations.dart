import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/reservations/reservations_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Reservations extends StatelessWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Reservations_controller controller = Get.put(Reservations_controller());
    return RefreshIndicator(
      onRefresh: () async {
        await controller.get_doctor_reservations();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: StaticColor.primarycolor,
          ),
          body: SafeArea(
              child: GetBuilder<Reservations_controller>(builder: (controller) {
            return controller.statusRequest == StatusRequest.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: StaticColor.primarycolor,
                    ),
                  )
                : Container(
                    child: ListView(children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "الحجوزات ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                      "assets/images/time-management.png"),
                                ),
                                const Text(
                                  "مركز ألفا الطبي",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 2,
                              color: Colors.black45,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListView.builder(
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      //  height: MediaQuery.of(context).size.height * 0.1,
                                      margin: const EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                        color:
                                            StaticColor.thirdgrey.withAlpha(30),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center
                                        ,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children:  [
                                              Text(
                                                "${controller.data[index]['patient_medical_record']['FullName']}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text(
                                                " : الاسم",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        print(controller
                                                            .data[index]['id']);
                                                        Get.toNamed(
                                                            "/Edit_reservation",
                                                            arguments: {
                                                              "id": controller
                                                                      .data[
                                                                  index]['id']
                                                            });
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/pen.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            const Expanded(
                                                                child: Text(
                                                                    "تعديل")),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.defaultDialog(
                                                          title:
                                                              "هل تريد حذف الحجز ",
                                                          content: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                  controller.delete_patient_reservation(
                                                                      controller
                                                                              .data[index]
                                                                          [
                                                                          'id']);
                                                                  controller.data.removeAt(index);

                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 50,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: StaticColor
                                                                        .primarycolor,
                                                                  ),
                                                                  child: const Center(
                                                                      child:
                                                                          Text(
                                                                    "نعم ",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20),
                                                                  )),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 50,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: StaticColor
                                                                        .primarycolor,
                                                                  ),
                                                                  child: const Center(
                                                                      child:
                                                                          Text(
                                                                    "لا ",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20),
                                                                  )),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/delete.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            const Expanded(
                                                                child: Text(
                                                                    "حذف")),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await controller
                                                            .get_patient_info(
                                                                controller.data[
                                                                        index][
                                                                    'ID_PatientMedicalRecord']);
                                                        Get.toNamed(
                                                            "Patient_details_reserv");
                                                        // Get.bottomSheet(
                                                        //   controller.statusRequest==StatusRequest.loading?
                                                        //       CircularProgressIndicator(color: StaticColor.primarycolor,):
                                                        //   Container(
                                                        //     decoration: const BoxDecoration(
                                                        //         borderRadius: BorderRadius.only(
                                                        //             topLeft: Radius.circular(20),
                                                        //             topRight:
                                                        //             Radius.circular(20)),
                                                        //         color: Colors.white),
                                                        //     child: Column(
                                                        //       children: [
                                                        //         Container(
                                                        //           margin: const EdgeInsets.only(
                                                        //               bottom: 5),
                                                        //           padding: EdgeInsets.all(8),
                                                        //           width: MediaQuery.of(context)
                                                        //               .size
                                                        //               .width,
                                                        //           height: 60,
                                                        //           color: StaticColor.thirdgrey
                                                        //               .withAlpha(30),
                                                        //           child: Row(
                                                        //             mainAxisAlignment:
                                                        //             MainAxisAlignment.end,
                                                        //             children: [
                                                        //               Text(" ${controller.patinet_info[index][2]} :"),
                                                        //               const Text(" المريض",
                                                        //                   style: TextStyle(
                                                        //                       fontWeight:
                                                        //                       FontWeight
                                                        //                           .bold)),
                                                        //               Container(
                                                        //                 height: 50,
                                                        //                 width: 50,
                                                        //                 child: Image.asset(
                                                        //                     "assets/images/patient.png"),
                                                        //               )
                                                        //             ],
                                                        //           ),
                                                        //         ),
                                                        //       ],
                                                        //     ),
                                                        //   )
                                                        // );
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/service_details.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            const Expanded(
                                                                child: Text(
                                                                    "التفاصيل")),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "${controller.data[index]['BookingDate']}",
                                                  style: const TextStyle(
                                                      color: StaticColor
                                                          .primarycolor),
                                                ),
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
                      ),
                    ]),
                  );
          }))),
    );
  }
}
