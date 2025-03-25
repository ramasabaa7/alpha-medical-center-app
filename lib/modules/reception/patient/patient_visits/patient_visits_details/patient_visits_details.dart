import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/reception/patient/patient_visits/patient_visits_details/patient_visits_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Patient_visits_details extends StatelessWidget {
  const Patient_visits_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Patient_visits_details_controller controller =Get.put(Patient_visits_details_controller());
    return Scaffold(
      appBar: AppBar(backgroundColor: StaticColor.primarycolor,),
      body: Container(
        child: ListView(children: [

          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "تفاصيل الزيارة",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/images/medical-history.png"),
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
                  child:
                  controller.data[0]['Pressure']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
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
                  child:
                  controller.data[0]['Heartbeat']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
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
                  child:
                  controller.data[0]['BodyHeat']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
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
                  child:
                  controller.data[0]['ClinicalStory']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
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
                  child:
                  controller.data[0]['ClinicalExamination']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
                    "${controller.data[0]['ClinicalExamination']}",
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
                  child:
                  controller.data[0]['Comments'
                      '']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
                    "${controller.data[0]['Comments'
                        '']}",
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
                  "الطبيب المحول",
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
                  child:
                  controller.data[0]['ReferringPhysician']==null?
                  Text(
                    "لم يتم تحديده",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ):
                  Text(
                    "${controller.data[0]['ReferringPhysician']}",
                    style: TextStyle(
                        fontSize: 15, color: StaticColor.primarycolor),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed("/Xray_in_visit_details");
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height*0.07,
                        width:100,
                        decoration: BoxDecoration(
                            color: StaticColor.primarycolor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Container(height:55,width:55,child: Image.asset("assets/images/x-rays.png",)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed("/Lab_result_in_visit_details");
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height*0.07,
                        width:100,
                        decoration: BoxDecoration(
                            color: StaticColor.primarycolor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Container(height:55,width:55,child: Image.asset("assets/images/lab_req.png",)),
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
