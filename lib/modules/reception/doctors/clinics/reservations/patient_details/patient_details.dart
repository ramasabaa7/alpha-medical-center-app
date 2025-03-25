import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/reservations/reservations_controller.dart';
import 'package:project_after_update/modules/reception/doctors/doctors_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Patient_details_reserv extends StatelessWidget {
  const Patient_details_reserv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Reservations_controller controller = Get.put(Reservations_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,
      ),
        body: GetBuilder<Reservations_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            SafeArea(
                child: Container(
                  child: ListView(children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "تفاصيل المريض",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset("assets/images/patient.png"),
                              ),
                              Text(
                                "مركز ألفا الطبي",
                                style: TextStyle(fontSize: 15, color: Colors.grey),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "اسم المريض",
                            style: TextStyle(fontSize: 20,),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.patinet_info[2]}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            " الرقم الوطني",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.patinet_info[1]}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            " رقم الهاتف",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.patinet_info[4]}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            " العنوان",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.patinet_info[5]}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          SizedBox(height: 20),
                        ],

                      ),
                    ),
                  ]),
                )
            );
        })
    );
  }
}
