import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/insurance_company/insurance_company_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/display_users_in_reception_controller.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';


class Insurance_company extends StatelessWidget {
  const Insurance_company({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Insurance_company_controller controller = Get.put(Insurance_company_controller());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          onPressed: (){
            Get.toNamed("/Add_insurance_company");
          },
          child: Icon(Icons.add_circle),
        ),
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [

              Tab(
                child: Container(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    "assets/images/Insurance-pana.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Tab(
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     child: Image.asset(
              //       "assets/images/import.png",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              // Tab(
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     child: Image.asset(
              //       "assets/images/export.png",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              // Tab(
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     child: Image.asset(
              //       "assets/images/receptionist.png",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        body: GetBuilder<Insurance_company_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            TabBarView(
              children: [
                Container(
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "شركات التأمين",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "مركز ألفا الطبي",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black45,
                          ),
                        ],
                      ),
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
                        itemCount: controller.data.length
                        ,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  Container(
                                    padding: EdgeInsets.all(8),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   Row(
                                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                     children: [
                                     Container(
                                       height: 70,
                                       width: 70,
                                       child: Image.asset("assets/images/Insurance-pana.png"),
                                     ),
                                     Text("تفاصيل شركة التأمين",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                   ],),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.end ,
                                      children: [
                                        Text("${controller.data[index]['IN']}"),
                                        Text(" : IN",style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),),

                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.end ,
                                      children: [
                                        Text("${controller.data[index]['AMB']}"),
                                        Text(" : AMB",style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),),

                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.end ,
                                      children: [
                                        Text("${controller.data[index]['PM']}"),
                                        Text(" : PM",style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),),

                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.end ,
                                      children: [
                                        Text("${controller.data[index]['DV']}"),
                                        Text(" : DV",style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),),

                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.end ,
                                      children: [
                                        Text("${controller.data[index]['created_at']}"),
                                        Text(": التاريخ",style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),),

                                      ],
                                    ),


                                  ],
                                ),
                              ));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: StaticColor.primarycolor,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Container(
                                        width: 200,
                                        child: Image.asset(
                                            "assets/images/Insurance-pana.png",
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "${controller.data[index]['Name']}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title:
                                                "هل تريد تعديل نوع هذه الخدمة  ؟",
                                                content:
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                        Get.toNamed("/Edit_insurance_company",arguments: {
                                                          "company_id":controller.data[index]['id'],
                                                         // "id_section":controller.data_type_section[index]['id_section']
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "نعم",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),

                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "لا",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
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
                                                title: "هل تريد حذف هذه الخدمة ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                        controller.delete_insurance_company(controller.data[index]['id']);
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "نعم",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),

                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "لا",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
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
                  ]),
                ),
              ],
            );
        }),
      ),
    );
  }
}
