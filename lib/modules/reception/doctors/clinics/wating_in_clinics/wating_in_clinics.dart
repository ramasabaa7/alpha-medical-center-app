import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/wating_in_clinics/wating_in_clinics_controller.dart';
import 'package:project_after_update/modules/reception/doctors/doctors_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Wating_in_clinics extends StatelessWidget {
  const Wating_in_clinics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctors_controller doctor_controller =
        Get.put<Doctors_controller>(Doctors_controller());
    wating_in_clincis_controller controller = Get.put(wating_in_clincis_controller());
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
        body: SafeArea(
          child: GetBuilder<wating_in_clincis_controller>(builder: (controller){
            return
            controller.statusRequest==StatusRequest.loading?
                const Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
              TabBarView(
              children: [
              GetBuilder<wating_in_clincis_controller>(builder: (controller){
                return
                   ListView(children: [
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
                                        const Text("الدور متوقف حاليا",style: TextStyle(fontSize: 15),),
                                    const Icon(Icons.error_outline_outlined,color: Colors.red,)
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
                                    const Text("الدور يعمل حاليا",style: TextStyle(fontSize: 15),),
                                    const Icon(Icons.error_outline_outlined,color: Colors.green,)
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.6,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data_wating_req.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                             padding: const EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  color: StaticColor.thirdgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        " المريض : ${ controller.data_wating_req[index]['FullName']}   ",
                                        style: const TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),
                                      ),
                                      subtitle: Text(" الخدمة : ${controller.data_wating_req[index]['ServiceName']}"),
                                      trailing: Text(
                                        "${controller.data_wating_req[index]['CreatedRequiredPatientServices']}",
                                        style: const TextStyle(
                                            color: StaticColor.primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ),

                                    ),
                                  ],
                                )
                              ),
                            );
                          }),
                    )
                  ]);

              }),
                /////////////الأطباء
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.7,
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print("test id from wating ${controller.data[index]['id']}");
                                Get.toNamed("/doctors_details",arguments:{
                                  "id_doctor" : controller.data[index]['id']
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
                                  title:
                                 Row(children: [
                                   Text(
                                     "${controller.data[index]['name']}",
                                     style: const TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),
                                   ),
                                   Text(
                                     "  : اسم الطبيب  ",
                                     style: const TextStyle(fontWeight: FontWeight.bold),
                                   ),

                                 ],),
                                  // Text(
                                  //   "${controller.data[index]['name']} : اسم الطبيب  ",
                                  //   style: const TextStyle(fontWeight: FontWeight.bold),
                                  // ),
                                 // subtitle: const Text("حالة الطبيب  : متواجد"),
                                     trailing:
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // GestureDetector(
                                      // onTap: (){
                                      //   Get.toNamed("/Add_schedular",arguments: {
                                      //     "id_doctor" : controller.data[index]['id']
                                      //   });
                                      // }
                                      // ,child: Icon(Icons.calendar_month_rounded,color: StaticColor.primarycolor,)),
                                    // IconButton(onPressed: (){
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
                                    //                       doctor_controller.options,
                                    //                       whenEmpty:
                                    //                       "إختر أيام العمل",
                                    //                       onChanged: (value) {
                                    //                         doctor_controller
                                    //                             .selectedoptionlist
                                    //                             .value = value;
                                    //                         doctor_controller
                                    //                             .selectedoption
                                    //                             .value = "";
                                    //                         doctor_controller
                                    //                             .selectedoptionlist
                                    //                             .value
                                    //                             .forEach((element) {
                                    //                           doctor_controller
                                    //                               .selectedoption
                                    //                               .value = doctor_controller
                                    //                               .selectedoption
                                    //                               .value +
                                    //                               " " +
                                    //                               element;
                                    //                         });
                                    //                       },
                                    //                       selectedValues: doctor_controller
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
                                    //                       options: doctor_controller
                                    //                           .options_houer,
                                    //                       whenEmpty:
                                    //                       "إختر ساعات العمل",
                                    //                       onChanged: (value) {
                                    //                         doctor_controller
                                    //                             .selectedoptionlist_houer
                                    //                             .value = value;
                                    //                         doctor_controller
                                    //                             .selectedoption_houer
                                    //                             .value = "";
                                    //                         doctor_controller
                                    //                             .selectedoptionlist_houer
                                    //                             .value
                                    //                             .forEach((element) {
                                    //                           doctor_controller
                                    //                               .selectedoption_houer
                                    //                               .value = doctor_controller
                                    //                               .selectedoption_houer
                                    //                               .value +
                                    //                               " " +
                                    //                               element;
                                    //                         });
                                    //                       },
                                    //                       selectedValues: doctor_controller
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
                                    // }, icon: Icon(Icons.calendar_month_rounded,color: StaticColor.primarycolor,),
                                    // ),
                                    CircleAvatar(
                                      child: Image.asset("assets/images/doctor.png"),
                                    ),
                                  ],)


                                ),
                              ),
                            );
                          }),
                    )
                  ]
                  ),
                ),
                GetBuilder<wating_in_clincis_controller>(builder: (controller){
                  return
                    controller.statusRequest==StatusRequest.loading?
                    const Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "خدمات العيادة",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "مركز ألفا الطبي ",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
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
                              itemCount: controller.data_service.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("${controller.data_service[index]['Details']}"),
                                                  const Text(" : التفاصيل  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                                  const SizedBox(width: 5,),

                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                    );
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
                                                  "assets/images/clinic.png",
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "${controller.data_service[index]['Name']}",
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "${controller.data_service[index]['Price']}",
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 15),
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
                    );
                })
              ],
            );
          })
        ),
      ),
    );
  }
}
