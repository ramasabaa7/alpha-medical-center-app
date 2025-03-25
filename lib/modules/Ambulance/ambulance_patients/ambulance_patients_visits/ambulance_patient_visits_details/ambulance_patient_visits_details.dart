import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/ambulance_patient_visits_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Ambulance_Patient_visits_details extends StatelessWidget {
  const Ambulance_Patient_visits_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Ambulance_Patient_visits_details_controller controller =Get.put(Ambulance_Patient_visits_details_controller());
    return Scaffold(
      body: Container(
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
                  "تفاصيل الزيارة",
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
                    "${controller.data[0]['Title']}",
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
                  "الضغط",
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
                    "${controller.data[0]['Pressure']}",
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
                  "النبض ",
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
                    "${controller.data[0]['Heartbeat']}",
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
                  "الحرارة",
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
                    "${controller.data[0]['BodyHeat']}",
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
                  "القصة السريرية",
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
                    "${controller.data[0]['ClinicalStory']}",
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
                  "الفحص السريري",
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
                    "${controller.data[0]['ClinicalExamination']}",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ),
                ),
                const Text(
                  "الملاحظات",
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
                    "${controller.data[0]['Comments']}",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black45,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                    controller.go_to_edit();
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
                    GestureDetector(
                      onTap: (){
                        Get.defaultDialog(
                          title: "هل تريد حذف تفاصيل المعاينة",
                          content:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.delete_patient_visits_details(controller.data[0]['id']);
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
                                  child: Center(child: Text("نعم ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.back();
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
                                  child: Center(child: Text("لا ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                ),
                              ),
                            ],
                          ),
                        );
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
                  ],
                ),
              ],

            ),
          ),
        ]),
      ),
    );
  }
}
