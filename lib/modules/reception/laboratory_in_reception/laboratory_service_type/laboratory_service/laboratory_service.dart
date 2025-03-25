import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/clinics_in_managment_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/laboratory_center_services_controller.dart';
import 'package:project_after_update/modules/reception/laboratory_in_reception/laboratory_service_type/laboratory_service/laboratory_service_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Laboratory_service extends StatelessWidget {
  const Laboratory_service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    laboratory_service_controller controller =
        Get.put(laboratory_service_controller());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                      "assets/images/stopwatch.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
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
          body:
              GetBuilder<laboratory_service_controller>(builder: (controller) {
            return controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: StaticColor.primarycolor,
                    ),
                  )
                : TabBarView(
                    children: [
                    GetBuilder<laboratory_service_controller>(builder: (controller){
                      return   Container(
                        child: ListView(children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "قسم الإستقبال",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                controller.status==0?
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text("الدور متوقف حاليا",style: TextStyle(fontSize: 15),),
                                          Icon(Icons.error_outline_outlined,color: Colors.red,)
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "دور الإنتظار مركز ألفا الطبي",
                                      style: TextStyle(fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ) :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text("الدور يعمل حاليا",style: TextStyle(fontSize: 15),),
                                          Icon(Icons.error_outline_outlined,color: Colors.green,)
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "دور الإنتظار مركز ألفا الطبي",
                                      style: TextStyle(fontSize: 15, color: Colors.grey),
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
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data_wating_req.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10),
                                     // height: MediaQuery.of(context).size.height * 0.1,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      decoration: BoxDecoration(
                                        color: StaticColor.thirdgrey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child:  ListTile(
                                        title: Text(
                                      "   المريض : ${controller.data_wating_req[index]["FullName"]}   ",
                                        style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),
                                      ),
                                        subtitle: Text(" الخدمة : ${controller.data_wating_req[index]['ServiceName']}"),
                                        trailing: Text(
                                          "${controller.data_wating_req[index]['CreatedRequiredPatientServices']}",
                                          style: TextStyle(
                                              color: StaticColor.primarycolor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ]),
                      );
                    }),
                      Container(
                        child: ListView(children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "أطباء القسم",
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
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.7,
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data_doctor.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print("test id from wating ${controller.data_doctor[index]['id']}");
                                      Get.toNamed("/doctors_details",arguments:{
                                        "id_doctor" : controller.data_doctor[index]['id']
                                      }



                                      );
                                    },
                                    child:
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: MediaQuery.of(context).size.height * 0.1,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      decoration: BoxDecoration(
                                        color: StaticColor.thirdgrey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ListTile(
                                        title:  Text(
                                          "${controller.data_doctor[index]['name']} : اسم الطبيب  ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      //  subtitle: const Text("حالة الطبيب  : متواجد"),
                                        trailing:
                                  CircleAvatar(
                                  child: Image.asset("assets/images/doctor.png"),
                                          // onPressed: () {
                                          //   Get.bottomSheet(
                                          //     Container(
                                          //       width: double.infinity,
                                          //       padding: const EdgeInsets.all(8),
                                          //       decoration: const BoxDecoration(
                                          //           borderRadius: BorderRadius.only(
                                          //               topLeft: Radius.circular(30),
                                          //               topRight: Radius.circular(30)),
                                          //           color: Colors.white),
                                          //       child: Column(
                                          //         children: [
                                          //           const Text(
                                          //             "تعديل المواعيد",
                                          //             style: TextStyle(
                                          //                 fontSize: 20,
                                          //                 fontWeight: FontWeight.bold),
                                          //           ),
                                          //           Container(
                                          //             height: MediaQuery.of(context)
                                          //                 .size
                                          //                 .height *
                                          //                 0.45,
                                          //             padding: const EdgeInsets.all(8),
                                          //             child: Card(
                                          //               child: Column(
                                          //                 crossAxisAlignment:
                                          //                 CrossAxisAlignment.center,
                                          //                 mainAxisAlignment:
                                          //                 MainAxisAlignment
                                          //                     .spaceAround,
                                          //                 children: [
                                          //                   ListTile(
                                          //                     trailing: const Text(
                                          //                         "أيام العمل"),
                                          //                     subtitle:
                                          //                     DropDownMultiSelect(
                                          //                       options:
                                          //                       controller.options,
                                          //                       whenEmpty:
                                          //                       "إختر أيام العمل",
                                          //                       onChanged: (value) {
                                          //                         controller
                                          //                             .selectedoptionlist
                                          //                             .value = value;
                                          //                         controller
                                          //                             .selectedoption
                                          //                             .value = "";
                                          //                         controller
                                          //                             .selectedoptionlist
                                          //                             .value
                                          //                             .forEach((element) {
                                          //                           controller
                                          //                               .selectedoption
                                          //                               .value = controller
                                          //                               .selectedoption
                                          //                               .value +
                                          //                               " " +
                                          //                               element;
                                          //                         });
                                          //                       },
                                          //                       selectedValues: controller
                                          //                           .selectedoptionlist
                                          //                           .value,
                                          //                     ),
                                          //                   ),
                                          //                   const SizedBox(
                                          //                     height: 10,
                                          //                   ),
                                          //                   ListTile(
                                          //                     trailing: const Text(
                                          //                         "ساعات العمل"),
                                          //                     subtitle:
                                          //                     DropDownMultiSelect(
                                          //                       options: controller
                                          //                           .options_houer,
                                          //                       whenEmpty:
                                          //                       "إختر ساعات العمل",
                                          //                       onChanged: (value) {
                                          //                         controller
                                          //                             .selectedoptionlist_houer
                                          //                             .value = value;
                                          //                         controller
                                          //                             .selectedoption_houer
                                          //                             .value = "";
                                          //                         controller
                                          //                             .selectedoptionlist_houer
                                          //                             .value
                                          //                             .forEach((element) {
                                          //                           controller
                                          //                               .selectedoption_houer
                                          //                               .value = controller
                                          //                               .selectedoption_houer
                                          //                               .value +
                                          //                               " " +
                                          //                               element;
                                          //                         });
                                          //                       },
                                          //                       selectedValues: controller
                                          //                           .selectedoptionlist_houer
                                          //                           .value,
                                          //                     ),
                                          //                   ),
                                          //                   Container(
                                          //                     padding:
                                          //                     const EdgeInsets.all(5),
                                          //                     alignment: Alignment.center,
                                          //                     height: 50,
                                          //                     width:
                                          //                     MediaQuery.of(context)
                                          //                         .size
                                          //                         .width *
                                          //                         0.3,
                                          //                     decoration: BoxDecoration(
                                          //                       borderRadius:
                                          //                       BorderRadius.circular(
                                          //                           10),
                                          //                       color: StaticColor
                                          //                           .primarycolor,
                                          //                     ),
                                          //                     child: const Text(
                                          //                       "تأكيد",
                                          //                       style: TextStyle(
                                          //                           color: Colors.white,
                                          //                           fontSize: 20),
                                          //                     ),
                                          //                   ),
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //           )
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   );
                                          // },

                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ]
                        ),
                      ),
                    GetBuilder<laboratory_service_controller>(builder: (controller){
                      return   Container(
                        child: ListView(children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  " الخدمات المتوافرة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "مركز ألفا الطبي ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                const Divider(
                                  height: 10,
                                  color: Colors.black45,
                                ),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.6,
                                  child: GridView.builder(
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 20),
                                    shrinkWrap: true,
                                    itemCount: controller.data.length,
                                    //controller.data[0]['center_service'].length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.bottomSheet(Container(
                                            padding: EdgeInsets.all(10),
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  " : التفاصيل  ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Text(
                                                    "${controller.data[index]['Details']}"),
                                                //  Text("${controller.data[0]['center_service'][index]['Details']}"),

                                              ],
                                            ),
                                          ));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(20),
                                                  bottomRight:
                                                  Radius.circular(20)),
                                              color: StaticColor.primarycolor,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    width: 200,
                                                    child: Image.asset(
                                                        "assets/images/blood-test.png",
                                                        fit: BoxFit.fill),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    " ${controller.data[index]['Name']}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                // Expanded(
                                                //   flex: 2,
                                                //   child: Text(
                                                //     " ${controller.data[0]['center_service'][index]['Name']}",
                                                //     style: TextStyle(
                                                //         color: Colors.white, fontSize: 15),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "${controller.data[index]['Price']}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
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
                          ),
                        ]),
                      );
                    })
                    ],
                  );
          })),
    );
  }
}
