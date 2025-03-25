import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/manager/salary_increase/salary_increase_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Salary_increase extends StatelessWidget {
  const Salary_increase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Salary_increase_controller controller =
        Get.put(Salary_increase_controller());

    return RefreshIndicator(
      onRefresh: () async {
        await controller.get_all_salary_increase();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: StaticColor.primarycolor,
          ),
          body: GetBuilder<Salary_increase_controller>(builder: (controller) {
            return controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: StaticColor.primarycolor,
                    ),
                  )
                : Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "قسم الإدارة",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                //  padding: EdgeInsets.all(2),
                                color: StaticColor.primarycolor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 100,
                                      child: Image.asset(
                                        "assets/images/logo.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: const Text(
                                        "طلبات زيادة الرواتب والنسب",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 10,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                        //   Card(
                        //    child:
                        GetBuilder<Salary_increase_controller>(
                            builder: (controller) {
                          return Container(
                            //  padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: ()async{
                                      await controller.get_salary(controller.data[index]['user_id']);
                                      Get.bottomSheet(Container(
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(" ${controller.data_salary[2]} : الراتب  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            Text(" ${controller.data_salary[1]} : الإختصاص ",style: TextStyle(fontWeight: FontWeight.bold)),
                                            SizedBox(height: 5),
                                            Text("   التفاصيل : ${controller.data[index]['Details']}  ",style: TextStyle(fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ));

                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.14,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color:
                                            StaticColor.thirdgrey.withAlpha(30),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.defaultDialog(
                                                        title:
                                                            "هل تريد قبول طلب الإنضمام ",
                                                        content: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.defaultDialog(
                                                                  title:
                                                                      "يرجى إدخال الراتب الجديد",
                                                                  content:
                                                                      Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller.new_salary =
                                                                              value;
                                                                        },
                                                                        decoration: InputDecoration(
                                                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                            label: const Text(
                                                                              "الراتب الجديد ",
                                                                              style: TextStyle(fontSize: 20, color: StaticColor.primarycolor, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            suffixIcon: const Icon(Icons.credit_card_outlined),
                                                                            contentPadding: const EdgeInsets.all(15),
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                            controller.accept_salary_increase(controller.data[index]['id'],
                                                                                controller.data[index]['user_id']);
                                                                            controller.data.removeAt(index);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                const EdgeInsets.all(5),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                50,
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.3,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: StaticColor.primarycolor,
                                                                            ),
                                                                            child:
                                                                                const Text(
                                                                              "إضافة",
                                                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: Center(
                                                                    child: Text(
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
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: Center(
                                                                    child: Text(
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
                                                      height: 60,
                                                      width: 50,
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/approved.png",
                                                                fit:
                                                                    BoxFit.fill,
                                                              )),
                                                          const Expanded(
                                                              child:
                                                                  Text("قبول")),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.defaultDialog(
                                                        title:
                                                            "هل تريد رفض طلب الإنضمام ",
                                                        content: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.back();
                                                                controller.reject_salary_increase(
                                                                    controller.data[
                                                                            index]
                                                                        ['id']);
                                                                controller.data.removeAt(index);
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: Center(
                                                                    child: Text(
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
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: Center(
                                                                    child: Text(
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
                                                      height: 60,
                                                      width: 50,
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/cancel.png",
                                                                fit:
                                                                    BoxFit.fill,
                                                              )),
                                                          const Expanded(
                                                              child:
                                                                  Text("رفض")),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(6),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${controller.data[index]['user']['name']}",
                                                  style: TextStyle(
                                                      color: StaticColor
                                                          .primarycolor),
                                                ),
                                                Text(
                                                  " : اسم الموظف",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        })
                        //),
                      ],
                    ),
                  );
          })),
    );
  }
}
