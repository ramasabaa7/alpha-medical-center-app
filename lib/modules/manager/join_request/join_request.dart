import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';


// class Join_request_page extends StatefulWidget{
//   @override
//   Join_request createState() =>Join_request();
// }

class Join_request extends StatelessWidget {
 // const Join_request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Join_request_controller controller =Get.put(Join_request_controller());
    return RefreshIndicator(
      onRefresh:()async{
      await controller.get_all_join_request();
      } ,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
        ),
        body: SafeArea(
            child: GetBuilder<Join_request_controller>(builder: (controller){
              return

                Container(
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
                                      "طلبات الإنضمام",
                                      style: TextStyle(fontSize: 15, color: Colors.white),
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
                      GetBuilder<Join_request_controller>(builder: (controller){
                        return
                          controller.statusRequest==StatusRequest.loading?
                          Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                          controller.data.isEmpty?Container(child: Center(child: Text("لا يوجد طلبات انضمام لعرضها",style: TextStyle(color: StaticColor.primarycolor),),),):
                        //  Card(
                          //  child:
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:
                              ListView.builder(
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      height: MediaQuery.of(context).size.height * 0.1,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: StaticColor.thirdgrey.withAlpha(30),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: (){
                                                      Get.defaultDialog(
                                                        title: "يرجى تأكيد المعلومات التالية",
                                                        content:
                                                        Column(
                                                          children: [

                                                            Container(
                                                                margin: EdgeInsets.only(bottom: 10),
                                                                padding: const EdgeInsets.all(10),
                                                                width: MediaQuery.of(context).size.width,
                                                                height: MediaQuery.of(context).size.height * 0.07,
                                                                decoration: BoxDecoration(
                                                                  color: StaticColor.thirdgrey.withAlpha(20),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  border: Border(
                                                                    top: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    right: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    left: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    bottom: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    GetBuilder<Join_request_controller>(builder: (controller){
                                                                      return  DropdownButton(
                                                                        items: controller.department
                                                                            .map((e) => DropdownMenuItem(
                                                                          child: Text("$e"),
                                                                          value: e,
                                                                        ))
                                                                            .toList(),
                                                                        onChanged: (val) {
                                                                          controller.changedepartment(val!);
                                                                          controller.type=val;
                                                                          controller.selected = val.toString();
                                                                          print(controller.selected);
                                                                        },
                                                                        style: const TextStyle(
                                                                            fontSize: 15,
                                                                            color: StaticColor.blackcolor,
                                                                            fontWeight: FontWeight.bold),
                                                                        hint: Text("${controller.selected}"),
                                                                      );
                                                                    }),
                                                                    const Icon(Icons.work_outline_outlined,
                                                                        color: StaticColor.primarycolor),
                                                                  ],
                                                                )),
                                                            SizedBox(height: 5,),
                                                            Container(
                                                                margin: EdgeInsets.only(bottom: 10),
                                                                padding: const EdgeInsets.all(10),
                                                                width: MediaQuery.of(context).size.width,
                                                                height: MediaQuery.of(context).size.height * 0.07,
                                                                decoration: BoxDecoration(
                                                                  color: StaticColor.thirdgrey.withAlpha(20),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  border: Border(
                                                                    top: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    right: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    left: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    bottom: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    GetBuilder<Join_request_controller>(builder: (controller){
                                                                      return  DropdownButton(
                                                                        items: controller.data_service_to_show
                                                                            .map((v) => DropdownMenuItem(
                                                                          child: Text("$v"),
                                                                          value: v,
                                                                        ))
                                                                            .toList(),
                                                                        onChanged: (value) {
                                                                          controller.changedepartment_two(value as String);
                                                                          controller.type2=value;
                                                                          controller.selected2 = value.toString();
                                                                          print(controller.selected2);
                                                                        },
                                                                        style: const TextStyle(
                                                                            fontSize: 15,
                                                                            color: StaticColor.blackcolor,
                                                                            fontWeight: FontWeight.bold),
                                                                        hint: Text("${controller.selected2}"),
                                                                      );
                                                                    }),
                                                                    const Icon(Icons.medical_services_outlined,
                                                                        color: StaticColor.primarycolor),
                                                                  ],
                                                                )),
                                                            SizedBox(height: 5,),
                                                            Container(
                                                                margin: EdgeInsets.only(bottom: 10),
                                                                padding: const EdgeInsets.all(10),
                                                                width: MediaQuery.of(context).size.width,
                                                                height: MediaQuery.of(context).size.height * 0.07,
                                                                decoration: BoxDecoration(
                                                                  color: StaticColor.thirdgrey.withAlpha(20),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  border: Border(
                                                                    top: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    right: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    left: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                    bottom: BorderSide(
                                                                        width: 1, color: Colors.black.withAlpha(80)),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    GetBuilder<Join_request_controller>(builder: (controller){
                                                                      return  DropdownButton(
                                                                        items: controller.data_roles_to_show
                                                                            .map((v) => DropdownMenuItem(
                                                                          child: Text("$v"),
                                                                          value: v,
                                                                        ))
                                                                            .toList(),
                                                                        onChanged: (value) {
                                                                          controller.changedepartment_thre(value as String);
                                                                          controller.type3=value;
                                                                          controller.selected3 = value.toString();
                                                                          print(controller.selected3);
                                                                        },
                                                                        style: const TextStyle(
                                                                            fontSize: 15,
                                                                            color: StaticColor.blackcolor,
                                                                            fontWeight: FontWeight.bold),
                                                                        hint: Text("${controller.selected3}"),
                                                                      );
                                                                    }),
                                                                    const Icon(Icons.work_history_outlined,
                                                                        color: StaticColor.primarycolor),
                                                                  ],
                                                                )),
                                                            SizedBox(height: 10,),
                                                          ],
                                                        ),
                                                        textConfirm: "تأكيد",
                                                        confirmTextColor: Colors.white,
                                                        onConfirm: (){
                                                          Get.back();
                                                          controller.accept_join(controller.data[index]['id']);
                                                          controller.data.removeAt(index);
                                                        },
                                                        textCancel: "رجوع",
                                                        onCancel: (){
                                                          Get.back();
                                                        }

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
                                                                "assets/images/approved.png",
                                                                fit: BoxFit.fill,
                                                              )),
                                                          const Expanded(child: Text("قبول")),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      Get.defaultDialog(
                                                        title: "هل تريد رفض طلب الإنضمام ",
                                                        content:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (){
                                                                Get.back();
                                                                controller.reject_join(controller.data[index]['id']);
                                                                      controller.data.removeAt(index);

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
                                                      height: 60,
                                                      width: 50,
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child: Image.asset(
                                                                "assets/images/cancel.png",
                                                                fit: BoxFit.fill,
                                                              )),
                                                          const Expanded(child: Text("رفض")),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: ListTile(
                                                trailing: GestureDetector(
                                                  onTap: () {
                                                    Get.bottomSheet(Container(
                                                      decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(20),
                                                              topRight: Radius.circular(20)),
                                                          color: Colors.white),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin: const EdgeInsets.only(
                                                                bottom: 8),
                                                            padding: EdgeInsets.all(8),
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            height: 60,
                                                            color: StaticColor.thirdgrey
                                                                .withAlpha(30),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Text(" ${controller.data[0]['type_user']['Name']} :"),
                                                                const Text(" الإختصاص",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.bold)),
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child: Image.asset(
                                                                      "assets/images/medical-team.png"),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: const EdgeInsets.only(
                                                                bottom: 8),
                                                            padding: EdgeInsets.all(8),
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            height: 60,
                                                            color: StaticColor.thirdgrey
                                                                .withAlpha(30),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Text(" ${controller.data[index]['email']} :"),
                                                                const Text(" البريد الإلكتروني",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.bold)),
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child: Icon(Icons.email,color: StaticColor.primarycolor,),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: const EdgeInsets.only(
                                                                bottom: 8),
                                                            padding: EdgeInsets.all(8),
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            height: 60,
                                                            color: StaticColor.thirdgrey
                                                                .withAlpha(30),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Text(" ${controller.data[index]['salary']} :"),
                                                                const Text(" الراتب",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.bold)),
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child: Icon(Icons.monetization_on,color: StaticColor.primarycolor,),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: const EdgeInsets.only(
                                                                bottom: 8),
                                                            padding: EdgeInsets.all(8),
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            height: 60,
                                                            color: StaticColor.thirdgrey
                                                                .withAlpha(30),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Text(" ${controller.data[index]['created_at']} :"),
                                                                const Text("تاريخ الطلب",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.bold)),
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child: Icon(Icons.date_range,color: StaticColor.primarycolor,),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: const EdgeInsets.only(
                                                                bottom: 8),
                                                            padding: EdgeInsets.all(8),
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            height: 60,
                                                            color: StaticColor.thirdgrey
                                                                .withAlpha(30),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Text(" ${controller.data[index]['types_of_center_services']['Name']} :"),
                                                                const Text(" نوع الخدمة",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.bold)),
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child: Icon(Icons.medical_services,color: StaticColor.primarycolor,),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    child:
                                                    Image.asset("assets/images/doctor.png"),
                                                  ),
                                                ),
                                                leading:  Text("${controller.data[index]['name']}"),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            );
                         // );
                      })
                    ],
                  ),
                );
            })
        ),
      )
    );
  }
}
