import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/clinics_in_managment_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/laboratory_center_services_controller.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/xray_center_services/xray_center_service_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Xray_center_services extends StatelessWidget {
  const Xray_center_services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Xray_center_service_controller controller =
        Get.put(Xray_center_service_controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "أطباء الأشعة",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/images/doctor.png"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "مركز ألفا الطبي",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
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
              GetBuilder<Xray_center_service_controller>(builder: (controller) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.data_doctor.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed("/Doctors_details_in_xray", arguments: {
                              "id": controller.data_doctor[index]['id']
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            "/Doctors_details_in_managment",
                                            arguments: {
                                              "id": controller
                                                  .data_doctor[index]['id']
                                            });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Image.asset(
                                            "assets/images/service_details.png"),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "${controller.data_doctor[index]['name']} :",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    StaticColor.primarycolor),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "اسم الطبيب",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CircleAvatar(
                                            child: Image.asset(
                                                "assets/images/doctor.png"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Text("اسم العيادة : الأطفال",style: TextStyle(color: Colors.grey),),
                                // Text(" حالة الطبيب : متواجد",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              })
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          child: const Icon(Icons.add_circle),
          onPressed: () {
            Get.toNamed("/Add_xray_service",
                arguments: {"id_type": controller.id_type});
          },
        ),
        body: GetBuilder<Xray_center_service_controller>(builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: StaticColor.primarycolor,
                  ),
                )
              : Container(
                  child: ListView(children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            " الخدمات المتوافرة",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<Xray_center_service_controller>(
                                  builder: (controller) {
                                return Switch(
                                  value: controller.droped,
                                  onChanged: (val) {
                                    controller.ontapdropdown(val);

                                    if (val == true) {
                                      controller.change_status(
                                          controller.id_type, 1);
                                    } else
                                      (controller.change_status(
                                          controller.id_type, 0));
                                  },
                                );
                              }),
                              const Text(
                                "مركز ألفا الطبي",
                                style: TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.black45,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 20),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(Container(
                                      padding: const EdgeInsets.all(10),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${controller.data[index]['Details']}"),
                                              const Text(
                                                " : التفاصيل  ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.info_outline,color: StaticColor.primarycolor,),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${controller.data[index]['Price']}"),
                                              const Text(
                                                " : سعر الخدمة  ",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Icon(Icons.monetization_on_outlined,color: StaticColor.primarycolor,),
                                               SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    ));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: StaticColor.primarycolor,
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              width: 100,
                                              child: Image.asset(
                                                  "assets/images/x-rays.png",
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              " ${controller.data[index]['Name']}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "${controller.data[index]['Price']}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                      title:
                                                          "هل تريد تعديل نوع هذه الخدمة ؟",
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                              Get.toNamed(
                                                                  "/Edit_xray_service",
                                                                  arguments: {
                                                                    "id_type": controller
                                                                            .data[index]
                                                                        [
                                                                        'id_TypeCenterServices'],
                                                                    "id": controller
                                                                            .data[
                                                                        index]['id']
                                                                  });
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
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
                                                                        .circular(
                                                                            10),
                                                                color: StaticColor
                                                                    .primarycolor,
                                                              ),
                                                              child: const Text(
                                                                "نعم",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
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
                                                                  Alignment
                                                                      .center,
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
                                                                        .circular(
                                                                            10),
                                                                color: StaticColor
                                                                    .primarycolor,
                                                              ),
                                                              child: const Text(
                                                                "لا",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        "assets/images/pen.png"),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                      title:
                                                          "هل تريد حذف هذه الخدمة   ؟",
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                              controller.delete_xray_services(
                                                                  controller.data[
                                                                              0]
                                                                          [
                                                                          'center_service']
                                                                      [
                                                                      index]['id']);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
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
                                                                        .circular(
                                                                            10),
                                                                color: StaticColor
                                                                    .primarycolor,
                                                              ),
                                                              child: const Text(
                                                                "نعم",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
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
                                                                  Alignment
                                                                      .center,
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
                                                                        .circular(
                                                                            10),
                                                                color: StaticColor
                                                                    .primarycolor,
                                                              ),
                                                              child: const Text(
                                                                "لا",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        "assets/images/delete.png"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      )),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                );
        }));
  }
}
