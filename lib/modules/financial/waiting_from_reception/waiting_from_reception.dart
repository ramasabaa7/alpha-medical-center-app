import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/waiting_from_reception_Controller.dart';
import 'dart:ui';

import 'package:project_after_update/static_colors/StaticColors.dart';

class waiting_from_reception extends StatelessWidget {
  const waiting_from_reception({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Wating_from_reception_controller controller =
        Get.put(Wating_from_reception_controller());
    return RefreshIndicator(
      onRefresh: ()async{
        await controller.get_required_services();
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 170, bottom: 20),
              child: Text(
                'خدمات المرضى',
                style: TextStyle(color: Colors.white, fontSize: 27),
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Color(0xff9bb4fd),
            elevation: 0,
          ),
          body: SafeArea(child:
              GetBuilder<Wating_from_reception_controller>(builder: (controller) {
            return controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: StaticColor.primarycolor,
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.data_details.length,
                          itemBuilder: (context, index) {
                            //  final patient = financialController.patients[index];

                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(
                                        0xff9bb4fd), // تحديد لون الحدود الجديد
                                    width: 2.0, // تحديد عرض الحدود الجديدة
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      10.0), // تحديد شكل الحواف
                                ),
                                // باقي الأكواد هنا
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              "assets/images/patient.png"),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Text(
                                                  "${controller.data_details[index]['patient_medical_record']['FullName']} : "),
                                              Text(
                                                "اسم المريض",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        StaticColor.primarycolor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed("/InvoicePage", arguments: {
                                          "name": controller.data_details[index]
                                                  ['patient_medical_record']
                                              ['FullName'],
                                          "IDPatientRecord" : controller.data_details[index]['IDPatientRecord'],
                                          "id_visits":controller.data_details[index]['id']
                                        });
                                      },
                                      child: Text(
                                        'إنشاء فاتورة',
                                        style: TextStyle(
                                            color: Color(0xff9bb4fd),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          }))),
    );
  }
}
