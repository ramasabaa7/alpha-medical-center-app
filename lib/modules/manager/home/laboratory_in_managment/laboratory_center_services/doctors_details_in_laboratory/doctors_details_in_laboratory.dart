import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/doctors_details_in_managment/doctors_details_in_managment_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/doctors_details_in_laboratory/doctors_details_in_laboratory_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Doctors_details_in_laboratory extends StatelessWidget {
  const Doctors_details_in_laboratory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctor_details_in_laboratory_controller controller =Get.put(Doctor_details_in_laboratory_controller());
    return Scaffold(
      body: GetBuilder<Doctor_details_in_laboratory_controller>(builder: (controller){
        return
        controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
          Container(
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
                      "تفاصيل الطبيب",
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
                      "اسم الطبيب",
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
                      "تاريخ الإنضمام",
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
                        "${controller.data_doctor['created_at']}",
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
          );
      })
    );
  }
}
