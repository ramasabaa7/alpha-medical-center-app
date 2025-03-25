import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/ambulance_in_managment/details_user_in_ambulance/details_user_in_ambulance_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/details_of_users/details_of_users_controller.dart';
import 'package:project_after_update/modules/reception/doctors/doctors_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Details_of_user_ambulance extends StatelessWidget {
  const Details_of_user_ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Details_of_user_ambulance_controller controller = Get.put(Details_of_user_ambulance_controller());
    return Scaffold(
        body: GetBuilder<Details_of_user_ambulance_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            SafeArea(
                child: Container(
                  child: ListView(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: "البحث",
                                    hintStyle: const TextStyle(fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10)),
                                    filled: true,
                                    fillColor: Colors.grey[200]),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: StaticColor.primarycolor,
                            ),
                            width: 60,
                            height: 55,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_active_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "تفاصيل الموظف",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "مركز ألفا الطبي",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "اسم الموظف",
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
                              "${controller.data_doctor['name']}",
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
                            "البريد الالكتروني",
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
                              "${controller.data_doctor['email']}",
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
                            " الراتب",
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
                              "${controller.data_doctor['salary']}",
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
                            "النوع",
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
                              "${controller.data_doctor['type']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
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
