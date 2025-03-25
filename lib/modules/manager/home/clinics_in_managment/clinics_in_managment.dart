import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/clinics_in_managment_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Clinics_in_managment extends StatelessWidget {
  const Clinics_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Clinics_in_managment_controller controller=Get.put(Clinics_in_managment_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: StaticColor.primarycolor,
        child: Icon(Icons.add_circle),
        onPressed: (){
          Get.toNamed("/Add_clinics",arguments: {
            "id_section":controller.id_section
          });
        },
      ),
      body: GetBuilder<Clinics_in_managment_controller>(builder: (controller){
        return
        controller.statusRequest==StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),) :
          Container(
            child: ListView(children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "عيادات المركز",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/images/hospital.png"),
                        ),
                        Text(
                          "مركز ألفا الطبي",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],),
                    const Divider(
                      height: 10,
                      color: Colors.black45,
                    ),
                    SizedBox(height: 20,),
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
                              Get.toNamed("/Clinics_details_in_managment",arguments: {
                                "id_type":controller.data[index]['id'],
                                "status":controller.data[index]['Status']
                              });
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
                                        " ${controller.data[index]['Name']}",
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
                                                middleText: "",
                                                title:
                                                "هل تريد تعديل نوع هذه العيادة ؟",
                                                textConfirm: "نعم",
                                                confirmTextColor: Colors.white,
                                                onConfirm: (){
                                                  Get.back();
                                                  Get.toNamed("/Edit_clinics_type",arguments: {
                                                    "id":controller.data[index]['id'],
                                                    "id_section":controller.data[index]['id_section']
                                                  });

                                                },
                                                textCancel: "لا",
                                                onCancel: (){
                                                  Get.back();
                                                },
                                                // content: Row(
                                                //   mainAxisAlignment:
                                                //   MainAxisAlignment.spaceAround,
                                                //   children: [
                                                //     GestureDetector(
                                                //       onTap: (){
                                                //         Get.toNamed("/Edit_clinics_type",arguments: {
                                                //           "id":controller.data[index]['id'],
                                                //           "id_section":controller.data[index]['id_section']
                                                //         });
                                                //       },
                                                //       child: Container(
                                                //         padding:
                                                //         const EdgeInsets.all(5),
                                                //         alignment: Alignment.center,
                                                //         height: 50,
                                                //         width: MediaQuery.of(context)
                                                //             .size
                                                //             .width *
                                                //             0.2,
                                                //         decoration: BoxDecoration(
                                                //           borderRadius:
                                                //           BorderRadius.circular(
                                                //               10),
                                                //           color: StaticColor
                                                //               .primarycolor,
                                                //         ),
                                                //         child: const Text(
                                                //           "نعم",
                                                //           style: TextStyle(
                                                //               color: Colors.white,
                                                //               fontSize: 20),
                                                //         ),
                                                //       ),
                                                //
                                                //     ),
                                                //     GestureDetector(
                                                //       onTap: (){
                                                //         Get.back();
                                                //       },
                                                //       child: Container(
                                                //         padding:
                                                //         const EdgeInsets.all(5),
                                                //         alignment: Alignment.center,
                                                //         height: 50,
                                                //         width: MediaQuery.of(context)
                                                //             .size
                                                //             .width *
                                                //             0.2,
                                                //         decoration: BoxDecoration(
                                                //           borderRadius:
                                                //           BorderRadius.circular(
                                                //               10),
                                                //           color: StaticColor
                                                //               .primarycolor,
                                                //         ),
                                                //         child: const Text(
                                                //           "لا",
                                                //           style: TextStyle(
                                                //               color: Colors.white,
                                                //               fontSize: 20),
                                                //         ),
                                                //       ),
                                                //
                                                //     ),
                                                //   ],
                                                // ),
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
                                                middleText: "",
                                                title:
                                                "هل تريد حذف نوع هذه العيادة ؟",
                                                textConfirm: "نعم",
                                                confirmTextColor: Colors.white,
                                                onConfirm: (){
                                                  Get.back();
                                                  controller.delete_clinics_type(controller.data[index]['id']);

                                                },
                                                textCancel: "لا",
                                                onCancel: (){
                                                  Get.back();
                                                },
                                                // content: Row(
                                                //   mainAxisAlignment:
                                                //   MainAxisAlignment.spaceAround,
                                                //   children: [
                                                //     GestureDetector(
                                                //       onTap: (){
                                                //         controller.delete_clinics_type(controller.data[index]['id']);
                                                //       },
                                                //       child: Container(
                                                //         padding:
                                                //         const EdgeInsets.all(5),
                                                //         alignment: Alignment.center,
                                                //         height: 50,
                                                //         width: MediaQuery.of(context)
                                                //             .size
                                                //             .width *
                                                //             0.2,
                                                //         decoration: BoxDecoration(
                                                //           borderRadius:
                                                //           BorderRadius.circular(
                                                //               10),
                                                //           color: StaticColor
                                                //               .primarycolor,
                                                //         ),
                                                //         child: const Text(
                                                //           "نعم",
                                                //           style: TextStyle(
                                                //               color: Colors.white,
                                                //               fontSize: 20),
                                                //         ),
                                                //       ),
                                                //
                                                //     ),
                                                //     GestureDetector(
                                                //       onTap: (){
                                                //         Get.back();
                                                //       },
                                                //       child: Container(
                                                //         padding:
                                                //         const EdgeInsets.all(5),
                                                //         alignment: Alignment.center,
                                                //         height: 50,
                                                //         width: MediaQuery.of(context)
                                                //             .size
                                                //             .width *
                                                //             0.2,
                                                //         decoration: BoxDecoration(
                                                //           borderRadius:
                                                //           BorderRadius.circular(
                                                //               10),
                                                //           color: StaticColor
                                                //               .primarycolor,
                                                //         ),
                                                //         child: const Text(
                                                //           "لا",
                                                //           style: TextStyle(
                                                //               color: Colors.white,
                                                //               fontSize: 20),
                                                //         ),
                                                //       ),
                                                //
                                                //     ),
                                                //   ],
                                                // ),
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
              ),
            ]),
          );
      })
    );
  }
}
