import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/all_employee_status/all_employee_status_controller.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_controller.dart';
import 'package:project_after_update/modules/reception/home/all_employee_reception/all_employee_reception_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

// class Join_request_page extends StatefulWidget{
//   @override
//   Join_request createState() =>Join_request();
// }

class All_employee_manager extends StatelessWidget {
  // const Join_request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    all_employee_manager_controller controller = Get.put(all_employee_manager_controller());
    return RefreshIndicator(
        onRefresh: () async {
          await controller.get_all_user_status();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: StaticColor.primarycolor,
          ),
          body: SafeArea(
              child: GetBuilder<all_employee_manager_controller>(builder: (controller) {
                return Container(
                  child: ListView(
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "الموظفين",
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
                      GetBuilder<all_employee_manager_controller>(builder: (controller) {
                        return controller.statusRequest == StatusRequest.loading
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: StaticColor.primarycolor,
                          ),
                        )
                            : controller.data.isEmpty
                            ? Container(
                          child: const Center(
                            child: Text(
                              "لا يوجد  موظفين لعرضهم",
                              style: TextStyle(
                                  color: StaticColor.primarycolor),
                            ),
                          ),
                        )
                            :
                        //  Card(
                        //  child:
                        Container(
                            padding: const EdgeInsets.all(8),
                            height:
                            MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GetBuilder<all_employee_manager_controller>(builder: (controller){
                              return ListView.builder(
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.1,
                                      margin:
                                      const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: StaticColor.thirdgrey
                                            .withAlpha(30),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          controller.data[index]['status'] ==
                                              1
                                              ? Container(
                                              child:
                                              GetBuilder<all_employee_manager_controller>(builder: (controller){
                                                return Row(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [

                                                    Switch(
                                                      value: controller.data[
                                                      index]
                                                      [
                                                      'status'] ==
                                                          1
                                                          ? true
                                                          : false,
                                                      onChanged: (val) {
                                                        controller
                                                            .ontapdropdown(
                                                            val);

                                                        if (val == true) {
                                                          controller.change_status(
                                                              controller.data[
                                                              index]
                                                              ['id'],
                                                              1);

                                                        } else{
                                                          controller.change_status(controller.data[index]['id'],0);
                                                        }
                                                      },
                                                    ),

                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    const Center(
                                                      child: Text(
                                                        "الحالة : متواجد",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .green,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })
                                          )
                                              : Container(
                                              child:
                                              GetBuilder<all_employee_manager_controller>(builder: (controller){
                                                return  Row(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      child: GetBuilder<
                                                          all_employee_manager_controller>(
                                                          builder:
                                                              (controller) {
                                                            return Switch(
                                                              value: controller.data[
                                                              index]
                                                              [
                                                              'status'] ==
                                                                  1
                                                                  ? true
                                                                  : false,
                                                              onChanged: (val) {
                                                                controller
                                                                    .ontapdropdown(
                                                                    val);

                                                                if (val ==
                                                                    true) {
                                                                  controller.change_status(
                                                                      controller
                                                                          .data[index]
                                                                      [
                                                                      'id'],
                                                                      1);
                                                                } else
                                                                  (controller.change_status(
                                                                      controller
                                                                          .data[index]
                                                                      [
                                                                      'id'],
                                                                      0));
                                                              },
                                                            );
                                                          }),
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                        child: const Center(
                                                          child: Text(
                                                            "الحالة :غير متواجد",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.red,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        )),
                                                  ],
                                                );
                                              })
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                    "${controller.data[index]['name']}"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    child: Image.asset(
                                                        "assets/images/doctor.png"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                  });
                            })
                        );
                        // );
                      })
                    ],
                  ),
                );
              })),
        ));
  }
}
