import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/x_ray_in_managment_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class X_ray_in_managment extends StatelessWidget {
  const X_ray_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    X_ray_in_managment_controller controller = Get.put(X_ray_in_managment_controller());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          onPressed: (){
            Get.toNamed("/Add_x_ray",arguments: {
              "id_section":controller.id_section
            });
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
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/x-rays.png",
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
              //       "assets/images/ray_doctor.png",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        body: GetBuilder<X_ray_in_managment_controller>(builder: (controller){
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
                            " أنواع الصور الشعاعية  ",
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
                            Get.toNamed("/Xray_center_services",arguments: {
                              "id_type" :controller.data[index]['id'],
                              "status":controller.data[index]['Status']
                            });
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
                                            "assets/images/x-ray_in_center.png",
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
                                                "هل تريد تعديل نوع هذه الصورة  ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                        Get.toNamed("/Edit_xray_type",arguments: {
                                                          "id":controller.data[index]['id'],
                                                          "id_section":controller.data[index]['id_section']
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
                                                title: "هل تريد حذف هذه الصورة الشعاعية ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                        controller.delete_xray_type(controller.data[index]['id']);
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
                // Container(
                //   height: MediaQuery.of(context).size.height,
                //   child: ListView(
                //     children: [
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: const [
                //             Text(
                //               "الواردات ",
                //               style: TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.bold),
                //             ),
                //             Text(
                //               "مركز الفا الطبي",
                //               style: TextStyle(fontSize: 15, color: Colors.grey),
                //             ),
                //             Divider(
                //               height: 5,
                //               color: Colors.black45,
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //           height: MediaQuery.of(context).size.height * 0.6,
                //           child:
                //           GetBuilder<X_ray_in_managment_controller>(
                //               builder: (controller) {
                //                 return ListView.builder(
                //                     shrinkWrap: true,
                //                     itemCount: 4,
                //                     itemBuilder: (context, index) {
                //                       return controller.droped == false
                //                           ? Container(
                //                         padding:
                //                         const EdgeInsets.symmetric(horizontal: 10),
                //                         margin: const EdgeInsets.only(top: 10),
                //                         height:
                //                         MediaQuery.of(context).size.height *
                //                             0.1,
                //                         width: MediaQuery.of(context).size.width *
                //                             0.8,
                //                         decoration: BoxDecoration(
                //                             color: StaticColor.thirdgrey
                //                                 .withAlpha(30),
                //                             borderRadius:
                //                             BorderRadius.circular(20)),
                //                         child: Row(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 GestureDetector(
                //                                     onTap: () {
                //                                       controller.ontapdropdown(
                //                                           controller.droped);
                //                                       print(controller.droped);
                //                                     },
                //                                     child: const Icon(
                //                                         Icons.arrow_drop_down)),
                //                               ],
                //                             ),
                //                             const Text(
                //                               "2023-7-5",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold,color: StaticColor.primarycolor),
                //                             ),
                //                           ],
                //                         ),
                //                       )
                //                           : Container(
                //                         padding:
                //                         const EdgeInsets.symmetric(horizontal: 10),
                //                         margin: const EdgeInsets.only(top: 10),
                //                         height:
                //                         MediaQuery.of(context).size.height *
                //                             0.1,
                //                         width: MediaQuery.of(context).size.width *
                //                             0.8,
                //                         decoration: BoxDecoration(
                //                             color: StaticColor.thirdgrey
                //                                 .withAlpha(30),
                //                             borderRadius:
                //                             BorderRadius.circular(20)),
                //                         child: Column(
                //                           crossAxisAlignment:
                //                           CrossAxisAlignment.end,
                //                           children: [
                //                             Container(
                //                               child: Row(
                //                                 mainAxisAlignment:
                //                                 MainAxisAlignment
                //                                     .spaceBetween,
                //                                 children: [
                //                                   Row(
                //                                     mainAxisAlignment:
                //                                     MainAxisAlignment
                //                                         .spaceBetween,
                //                                     children: [
                //                                       GestureDetector(
                //                                           onTap: () {
                //                                             controller
                //                                                 .ontapdropdown(
                //                                                 controller
                //                                                     .droped);
                //                                             print(controller
                //                                                 .droped);
                //                                           },
                //                                           child: const Icon(Icons
                //                                               .arrow_drop_down)),
                //                                     ],
                //                                   ),
                //                                   const Text(
                //                                     "2023-7-5",
                //                                     style: TextStyle(
                //                                         fontWeight:
                //                                         FontWeight.bold,
                //                                         color: StaticColor
                //                                             .primarycolor),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                             SizedBox(height: 10,),
                //                             const Text(
                //                               " : المبلغ  ",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                           ],
                //                         ),
                //                       );
                //                     });
                //               })),
                //
                //     ],
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height,
                //   child: ListView(
                //     children: [
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: const [
                //             Text(
                //               "المدفوعات ",
                //               style: TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.bold),
                //             ),
                //             Text(
                //               "مركز الفا الطبي",
                //               style: TextStyle(fontSize: 15, color: Colors.grey),
                //             ),
                //             Divider(
                //               height: 5,
                //               color: Colors.black45,
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //           height: MediaQuery.of(context).size.height * 0.6,
                //           child:
                //           GetBuilder<X_ray_in_managment_controller>(
                //               builder: (controller) {
                //                 return ListView.builder(
                //                     shrinkWrap: true,
                //                     itemCount: 4,
                //                     itemBuilder: (context, index) {
                //                       return controller.droped_two == false
                //                           ? Container(
                //                         padding:
                //                         const EdgeInsets.symmetric(horizontal: 10),
                //                         margin: const EdgeInsets.only(top: 10),
                //                         height:
                //                         MediaQuery.of(context).size.height *
                //                             0.1,
                //                         width: MediaQuery.of(context).size.width *
                //                             0.8,
                //                         decoration: BoxDecoration(
                //                             color: StaticColor.thirdgrey
                //                                 .withAlpha(30),
                //                             borderRadius:
                //                             BorderRadius.circular(20)),
                //                         child: Row(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 GestureDetector(
                //                                     onTap: () {
                //                                       controller.ontapdropdown_two(
                //                                           controller.droped_two);
                //                                       print(controller.droped_two);
                //                                     },
                //                                     child: const Icon(
                //                                         Icons.arrow_drop_down)),
                //                               ],
                //                             ),
                //                             const Text(
                //                               "2023-7-5",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold,color: StaticColor.primarycolor),
                //                             ),
                //                           ],
                //                         ),
                //                       )
                //                           : Container(
                //                         padding:
                //                         const EdgeInsets.symmetric(horizontal: 10),
                //                         margin: const EdgeInsets.only(top: 10),
                //                         height:
                //                         MediaQuery.of(context).size.height *
                //                             0.1,
                //                         width: MediaQuery.of(context).size.width *
                //                             0.8,
                //                         decoration: BoxDecoration(
                //                             color: StaticColor.thirdgrey
                //                                 .withAlpha(30),
                //                             borderRadius:
                //                             BorderRadius.circular(20)),
                //                         child: Column(
                //                           crossAxisAlignment:
                //                           CrossAxisAlignment.end,
                //                           children: [
                //                             Container(
                //                               child: Row(
                //                                 mainAxisAlignment:
                //                                 MainAxisAlignment
                //                                     .spaceBetween,
                //                                 children: [
                //                                   Row(
                //                                     mainAxisAlignment:
                //                                     MainAxisAlignment
                //                                         .spaceBetween,
                //                                     children: [
                //                                       GestureDetector(
                //                                           onTap: () {
                //                                             controller
                //                                                 .ontapdropdown_two(
                //                                                 controller
                //                                                     .droped_two);
                //                                           },
                //                                           child: const Icon(Icons
                //                                               .arrow_drop_down)),
                //                                     ],
                //                                   ),
                //                                   const Text(
                //                                     "2023-7-5",
                //                                     style: TextStyle(
                //                                         fontWeight:
                //                                         FontWeight.bold,
                //                                         color: StaticColor
                //                                             .primarycolor),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                             SizedBox(height: 10,),
                //                             const Text(
                //                               " : المبلغ  ",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                           ],
                //                         ),
                //                       );
                //                     });
                //               })),
                //
                //     ],
                //   ),
                // ),

              ],
            );
        }),
      ),
    );
  }
}
