import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/home_manager_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Home_manager extends StatelessWidget {
  const Home_manager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Home_manager_controller controller =Get.put(Home_manager_controller());
    
    return RefreshIndicator(
      onRefresh: ()async{
        await controller.get_all_section();
      },
      child: SafeArea(
        child: GetBuilder<Home_manager_controller>(builder: (controller){
          return
              controller.statusRequest==StatusRequest.loading?
                  Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
              Container(
                child: ListView(
                  children: [
                    // Container(
                    //   margin: const EdgeInsets.only(top: 10),
                    //   padding: const EdgeInsets.symmetric(horizontal: 15),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //           child: TextFormField(
                    //             decoration: InputDecoration(
                    //                 contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    //                 prefixIcon: const Icon(Icons.search),
                    //                 hintText: "البحث",
                    //                 hintStyle: const TextStyle(fontSize: 20),
                    //                 border: OutlineInputBorder(
                    //                     borderSide: BorderSide.none,
                    //                     borderRadius: BorderRadius.circular(10)),
                    //                 filled: true,
                    //                 fillColor: Colors.grey[200]),
                    //           )),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: StaticColor.primarycolor,
                    //         ),
                    //         width: 60,
                    //         height: 55,
                    //         padding: const EdgeInsets.symmetric(vertical: 8),
                    //         child: IconButton(
                    //           onPressed: () {
                    //             Get.toNamed("/Notifications_manager");
                    //           },
                    //           icon: const Icon(
                    //             Icons.notifications_active_outlined,
                    //             size: 25,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: StaticColor.primarycolor,
                            ),
                            width: 60,
                            height: 55,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child:
                            IconButton(
                              onPressed: () {
                                Get.toNamed("/All_employee_manager");
                              },
                              icon: const Icon(
                                Icons.work,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                            Text(
                              "قسم الإدارة",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
                            ),
                        ],),
                          SizedBox(height: 20,),
                          Container(
                            color: StaticColor.primarycolor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:70,
                                  width: 100,
                                  child: Image.asset(
                                    "assets/images/logo.jpg"
                                        "",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: const Text(
                                    " مركز ألفا الطبي",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black45,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.65,
                            child: GridView.builder(
                              itemCount: controller.data.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (context,index){
                                return
                                  GestureDetector(
                                    onTap: () {
                                      if(controller.data[index]['Name']=='clinic'){
                                        Get.toNamed("/Clinics_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='xray'){
                                        Get.toNamed("/X_ray_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='Laboratory'){
                                        Get.toNamed("/Laboratory_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='Store'){
                                        Get.toNamed("/Storage_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }
                                      else if(controller.data[index]['Name']=='Ambulance'){
                                        Get.toNamed("/Ambulance_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }
                                      else if(controller.data[index]['Name']=='Reception'){
                                        Get.toNamed("/reception_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }
                                      else if(controller.data[index]['Name']=='Finance'){
                                        Get.toNamed("/Finance_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      } else{
                                        Get.toNamed("/reception_in_managment",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }

                                    },
                                    onDoubleTap: (){
                                      Get.defaultDialog(
                                        title: "التعديلات المقترحة",
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                Get.back();
                                              controller.delete_section(controller.data[index]['id']);
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
                                                child: Center(child: Text("حذف ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                Get.back();
                                              Get.toNamed("/Edit_section",arguments: {
                                                "id" : controller.data[index]['id']

                                              });
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
                                                child: Center(child: Text("تعديل ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Container(
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                      // width: MediaQuery.of(context).size.width * 0.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: StaticColor.primarycolor,
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child:
                                                  controller.data[index]['Name']=='clinic'?
                                              Image.asset(
                                                  "assets/images/Body anatomy-rafiki.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='xray'?
                                              Image.asset(
                                                  "assets/images/Rheumatology-pana.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Laboratory'?
                                              Image.asset(
                                                  "assets/images/Laboratory-bro.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Store'?
                                              Image.asset(
                                                  "assets/images/storage.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Reception'?
                                              Image.asset(
                                                  "assets/images/reception.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Finance'?
                                              Image.asset(
                                                  "assets/images/finance.png",
                                                  fit: BoxFit.fill) :
                                              controller.data[index]['Name']=='Ambulance'?
                                              Image.asset(
                                                  "assets/images/Ambulance-section.png",
                                                  fit: BoxFit.fill):
                                              Image.asset(
                                                  "assets/images/logo.png",
                                                  fit: BoxFit.fill),
                                            ),
                                             Expanded(
                                                child:
                                                controller.data[index]['Name']=='clinic'?
                                                Text(
                                                  "العيادات",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ):
                                                controller.data[index]['Name']=='xray'?
                                                Text(
                                                  "الأشعة",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ):
                                                controller.data[index]['Name']=='Laboratory'?
                                                Text(
                                                  "المخبر",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Store'?
                                                Text(
                                                  "المخزن",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Reception'?
                                                Text(
                                                  "الإستقبال",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Finance'?
                                                Text(
                                                  "المالية",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Ambulance'?
                                                Text(
                                               "الإسعاف",
                                               style: TextStyle(
                                                   color: Colors.white, fontSize: 15),
                                             ):
                                                Text(
                                                  "${controller.data[index]['Name']}",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ),
                                             )
                                          ],
                                        )),
                                  );
                              },
                             // children: [

                                // GestureDetector(
                                //   onTap: (){
                                //     Get.toNamed("/X_ray_in_managment");
                                //   },
                                //   child: Container(
                                //     // height: MediaQuery.of(context).size.height * 0.3,
                                //     // width: MediaQuery.of(context).size.width * 0.5,
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         color: StaticColor.primarycolor,
                                //       ),
                                //       child: Column(
                                //         children: [
                                //           Expanded(
                                //             flex: 5,
                                //             child: Image.asset(
                                //                 "assets/images/Rheumatology-pana.png",
                                //                 fit: BoxFit.fill),
                                //           ),
                                //           const Expanded(
                                //               child: Text(
                                //                 "الأشعة",
                                //                 style:
                                //                 TextStyle(color: Colors.white, fontSize: 15),
                                //               ))
                                //         ],
                                //       )),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //     Get.toNamed("/Laboratory_in_managment");
                                //   },
                                //   child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         color: StaticColor.primarycolor,
                                //       ),
                                //       child: Column(
                                //         children: [
                                //           Expanded(
                                //             flex: 6,
                                //             child: Image.asset(
                                //                 "assets/images/Laboratory-bro.png",
                                //                 fit: BoxFit.fill),
                                //           ),
                                //           const Expanded(
                                //               child: Text(
                                //                 "المخبر",
                                //                 style:
                                //                 TextStyle(color: Colors.white, fontSize: 15),
                                //               ))
                                //         ],
                                //       )),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //     Get.toNamed("/Storage_in_managment");
                                //   },
                                //   child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         color: StaticColor.primarycolor,
                                //       ),
                                //       child: Column(
                                //         children: [
                                //           Expanded(
                                //             flex: 6,
                                //             child: Image.asset(
                                //                 "assets/images/storage.png",
                                //                 fit: BoxFit.fill),
                                //           ),
                                //           const Expanded(
                                //               child: Text(
                                //                 "المخزن",
                                //                 style:
                                //                 TextStyle(color: Colors.white, fontSize: 15),
                                //               ))
                                //         ],
                                //       )),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //
                                //   },
                                //   child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         color: StaticColor.primarycolor,
                                //       ),
                                //       child: Column(
                                //         children: [
                                //           Expanded(
                                //             flex: 6,
                                //             child: Image.asset(
                                //                 "assets/images/reception.png",
                                //                 fit: BoxFit.fill),
                                //           ),
                                //           const Expanded(
                                //               child: Text(
                                //                 "الإستقبال",
                                //                 style:
                                //                 TextStyle(color: Colors.white, fontSize: 15),
                                //               ))
                                //         ],
                                //       )),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //
                                //   },
                                //   child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         color: StaticColor.primarycolor,
                                //       ),
                                //       child: Column(
                                //         children: [
                                //           Expanded(
                                //             flex: 6,
                                //             child: Image.asset(
                                //                 "assets/images/finance.png",
                                //                 fit: BoxFit.fill),
                                //           ),
                                //           const Expanded(
                                //               child: Text(
                                //                 "المالية",
                                //                 style:
                                //                 TextStyle(color: Colors.white, fontSize: 15),
                                //               ))
                                //         ],
                                //       )),
                                // ),
                            //  ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
        })
      ),
    );
  }
}
