import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/manager/patients/patient_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Patients_in_managment extends StatelessWidget {
  const Patients_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Patient_controller controller =
        Get.put<Patient_controller>(Patient_controller());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "قسم الإدارة",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        child: Image.asset("assets/images/patient.png"),
                      ),
                      const Text(
                        "مرضى المركز",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed("/Patient_details_in_managment");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: StaticColor.thirdgrey.withAlpha(30),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outlined,
                                    ),
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title:
                                            "هل تريد حذف السجل الطبي الخاص بهذا المريض",
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.center,
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: StaticColor.primarycolor,
                                              ),
                                              child: const Text(
                                                "نعم",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.center,
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: StaticColor.primarycolor,
                                              ),
                                              child: const Text(
                                                "لا",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      controller
                                          .ontapdropdown(controller.droped);
                                      print(controller.droped);
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      child: Image.asset(
                                          "assets/images/patient_profile.png"),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "محمد سعيد",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
