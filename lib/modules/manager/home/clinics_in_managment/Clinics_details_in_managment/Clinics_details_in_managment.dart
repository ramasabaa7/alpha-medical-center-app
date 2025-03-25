import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/clinics_daetails_in_managment_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Clinics_details_in_managment extends StatelessWidget {
  const Clinics_details_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Clinics_details_in_manamgment_controller controller =
        Get.put<Clinics_details_in_manamgment_controller>(
            Clinics_details_in_manamgment_controller());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          child: Icon(Icons.add_circle),
          onPressed: (){
Get.toNamed("/Add_clinics_service",arguments: {
  "id_type":controller.id_type
});
          },
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
                    "assets/images/doctor.png",
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
              Tab(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/service_details.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        body:GetBuilder<Clinics_details_in_manamgment_controller>(builder: (controller){
          return
            TabBarView(
              children: [
                controller.statusRequest==StatusRequest.loading?
                    Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                Container(
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "أطباء العيادة",
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
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data_doctor.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  color: StaticColor.thirdgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed("/Doctors_details_in_managment",arguments: {
                                            "id":controller.data_doctor[index]['id']
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          child:Image.asset("assets/images/service_details.png") ,
                                        ),

                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "${controller.data_doctor[index]['name']} :",
                                              style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),
                                            ),
                                            SizedBox(width: 5,),
                                            Text("اسم الطبيب",style: TextStyle(fontWeight: FontWeight.bold),),
                                            SizedBox(width: 5,),
                                            CircleAvatar(
                                              child:Image.asset("assets/images/doctor.png") ,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],),



                                    //  Text("اسم العيادة : الأطفال",style: TextStyle(color: Colors.grey),),
                                    // Text(" حالة الطبيب : متواجد",style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                            );
                          }),
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
                //           GetBuilder<Clinics_details_in_manamgment_controller>(
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
                //           GetBuilder<Clinics_details_in_manamgment_controller>(
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
                //////here4
                GetBuilder<Clinics_details_in_manamgment_controller>(builder: (controller){
                  return
                    controller.statusRequest==StatusRequest.loading?
                    Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "خدمات العيادة",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<Clinics_details_in_manamgment_controller>(builder: (controller){
                                return
                                  Switch(value: controller.droped, onChanged: (val){
                                    controller.ontapdropdown(val);

                                    if(val==true){
                                      controller.change_status(controller.id_type,1);
                                    }else(
                                        controller.change_status(controller.id_type,0)
                                    );
                                  },);
                              }),
                              Text(
                                "مركز ألفا الطبي ",
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
                                    Get.bottomSheet(
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("${controller.data[index]['Details']}"),
                                                  Text(" : التفاصيل  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                                  Icon(Icons.info_outline,color: StaticColor.primarycolor,),
                                                  SizedBox(width: 5,),

                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("${controller.data[index]['Price']}"),
                                                  Text(" : سعر الخدمة  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                                  Icon(Icons.monetization_on,color: StaticColor.primarycolor,),
                                                  SizedBox(width: 5,),

                                                ],
                                              ),
                                              Divider(),
                                              
                                            ],
                                          ),
                                        )
                                    );
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
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
                                              width: 200,
                                              child: Image.asset(
                                                  "assets/images/clinic.png",
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
                                          SizedBox(height: 5,),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "${controller.data[index]['Price']}",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 15),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                      title:
                                                      "هل تريد تعديل نوع هذه الخدمة ؟",
                                                      content: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: (){
                                                              Get.back();
                                                              Get.toNamed("/Edit_clinics_service",arguments: {
                                                                "id_type":controller.data[index]['id_TypeCenterServices'],
                                                                "id":controller.data[index]['id']
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
                                                      title:
                                                      "هل تريد حذف هذه الخدمة ؟",
                                                      content: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: (){
                                                              Get.back();
                                                              controller.delete_clinics_services(controller.data[0]['center_service'][index]['id']);
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
                                          Spacer(),
                                        ],
                                      )),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                })
              ],
            );
        })
      ),
    );
  }
}
