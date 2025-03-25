import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/reception/patient/patient_services/patient_service_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Patient_services extends StatelessWidget {
  const Patient_services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Patient_service_controller controller =
        Get.put(Patient_service_controller());
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        await controller.get_patient_service();
      },
      child: SafeArea(
        child: GetBuilder<Patient_service_controller>(builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: StaticColor.primarycolor,
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
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
                            top: 5,
                            left: 130,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: Image.asset(
                                  "assets/images/patient_profile.png"),
                            ),
                          ),
                          Positioned(
                              top: 110,
                              left: 150,
                              child: Text(
                                "${controller.name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "قسم الإستقبال",
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
                                    "assets/images/assistance.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const Text(
                                  "خدمات المريض",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
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
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.builder(
                            itemCount: controller.data_details.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: StaticColor.thirdgrey.withAlpha(30),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title:
                                                    "هل تريد حذف هذه الخدمة ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "haaaaaaaaaaam id is ${controller.data_details[index]['IDrequiredPatientServices']}");
                                                        Get.back();
                                                        controller.delete_service_for_patienr(
                                                            controller.data_details[
                                                                    index][
                                                                'IDrequiredPatientServices']);
                                                        controller.data_details.removeAt(index);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "نعم",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "لا",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 50,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Image.asset(
                                                        "assets/images/delete.png",
                                                        fit: BoxFit.fill,
                                                      )),
                                                  const Expanded(
                                                      child: Text("حذف")),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.bottomSheet(Container(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(Icons.edit,color: StaticColor.primarycolor,),
                                                          ),
                                                           Text(
                                                              " التفاصيل",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 60,
                                                      color: StaticColor
                                                          .thirdgrey
                                                          .withAlpha(30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              " ${controller.data_details[index]['ServiceDetails']}"),
                                                        ],
                                                      ),
                                                      padding: EdgeInsets.all(8),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 60,
                                                      color: StaticColor
                                                          .thirdgrey
                                                          .withAlpha(30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              " ${controller.data_details[index]['ServicePrice']} :"),
                                                          const Text("السعر",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons
                                                                  .monetization_on,
                                                              color: StaticColor
                                                                  .primarycolor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 60,
                                                      color: StaticColor
                                                          .thirdgrey
                                                          .withAlpha(30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              " ${controller.data_details[index]['CreatedRequiredPatientServices']} :"),
                                                          const Text(
                                                              " تاريخ الطلب",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons.date_range,
                                                              color: StaticColor
                                                                  .primarycolor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 50,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Image.asset(
                                                        "assets/images/service_details.png",
                                                        fit: BoxFit.fill,
                                                      )),
                                                  const Expanded(
                                                      child: Text("التفاصيل")),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          "${controller.data_details[index]['ServiceName']}"),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
        }),
      ),
    ));
  }
}
