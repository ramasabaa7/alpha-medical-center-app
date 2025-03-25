import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/doctor/Doctor_patient_servies/Doctor_patient_servies_controller.dart';
import 'package:project_after_update/modules/doctor/Home/homeController.dart';
import 'package:project_after_update/modules/doctor/record/patientVisitRecordController.dart';

class patientVisitRecord extends StatelessWidget {
  patientVisitRecordController controller = Get.put(patientVisitRecordController());
  Doctor_patient_servies_servie_controller Doctor_patient_servies = Get.put(Doctor_patient_servies_servie_controller());
  //homeController homeControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<patientVisitRecordController>(builder: (controller){
      return
        Scaffold(
            backgroundColor: Color(0xffffffff),
            appBar: AppBar(
              toolbarHeight: 90,
              elevation: 0,
              backgroundColor: Color(0xff9bb4fd),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  controller.showDetails.assignAll(List.filled(100, false));
                  Get.back();
                },
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
                child: Text(
                  'سجل المريض ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 30),

                // if (controller.is_doctortransfer == true)
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       TextButton(
                //           onPressed: () {
                //             Get.toNamed('/DoctorDitailes');
                //           },
                //           child: Text('سامر علي',
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: Color(0xff9bb4fd)),
                //           )),
                //       Text(
                //         'اسم الطبيب المحول للمريض',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w200,
                //           color: Colors.black54,
                //         ),
                //       ),
                //     ],
                //   ),
                SizedBox(height: 15),
                // add some space between the title and the icon
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GestureDetector(
                    onTap: () async {
                      // int id = controller.id;
                      // print('${id}');
                      // await controller.get_patient_info(id);
                      Get.toNamed('/PersonalInformationD');
                    },
                    child: Container(
                      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      // margin: const EdgeInsets.only(bottom: 7,left: 7,right: 7),
                      width: Get.width,
                      height: 60,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(Icons.arrow_back_ios,
                                color: Color(0xff9bb4fd)),
                          ),
                          Text(
                            "البيانات الشخصية للمريض ",
                            style: TextStyle(
                              color: Color(0x8e000000),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.featured_play_list_outlined,
                              color: Color(0xff9bb4fd),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: GestureDetector(
                    onTap: () async {
                      print("iddddd");

              //        await Doctor_patient_servies.get_patient_services(controller.data2[0]['IDPatientRecord']);
                      Get.toNamed("/doctor_patient_servies");
                    },
                    child: Container(
                      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                      // margin: const EdgeInsets.only(bottom: 7,left: 7,right: 7),
                      width: Get.width,
                      height: 60,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(Icons.arrow_back_ios,
                                color: Color(0xff9bb4fd)),
                          ),
                          Text(
                            "خدمات المريض ",
                            style: TextStyle(
                              color: Color(0x8e000000),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.featured_play_list_outlined,
                              color: Color(0xff9bb4fd),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'سجل الزيارات',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 25,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  child: Expanded(child: _buildEmployeeList()),
                ),
              ],
            ));







    });
  }

  Widget _buildEmployeeList() {
    return ListView.builder(
      itemCount: controller.data.length,
      itemBuilder: (context, index) {
        return visit(index);
      },
    );
  }

  Widget visit(int index) {
    String createdAt = controller.data[index]['updated_at'];
    String date = '';
    String time = '';

    if (createdAt != null) {
      date = createdAt.substring(0, 10);
      time = createdAt.substring(12, 16);
    }

    return Obx(
          () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => controller.toggleDetails(index),
          child: Container(
            width: Get.width * 0.90,
            //height: Get.height * 0.20,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff9bb4fd),
                  width: 2.2,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),

            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // width: 0.5,
                    ),
                    Icon(Icons.arrow_drop_down_sharp),
                    Text(
                      '${date}',
                    ),
                    SizedBox(
                      width: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                if (controller.showDetails[index])
                  Column(
                    children: [
                      // if (!controller.doctor.value)
                      doctor(index),
                      // if (controller.data[index]['x_ray'] != null && controller.data[index]['x_ray'].length > 0) ashaa(index),
                      //if (controller.data[index]['laboratory_test_results'] != null && controller.data[index]['laboratory_test_results'].length > 0) makhbar(index),
                    ],
                  )
                else
                  SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widget1(String? s1, String? string, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7, left: 7, right: 7),
      width: Get.width,
      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (string != null)
              Expanded(
                child: Center(
                  child: Text(
                    '${string}',
                    maxLines: null,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              Expanded(
                child: Center(
                    child: Text('    ' + '_',
                        maxLines: null, textAlign: TextAlign.center)),
              ),
            SizedBox(
              width: 0,
            ),
            Center(
                child: Text('  :  ' + '${s1}',
                    maxLines: null, textAlign: TextAlign.center)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                icon,
                color: Color(0xff9bb4fd),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget doctor(int index) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.go_to_edit(index);
                      },
                      child: Text(
                        'تعديل',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9bb4fd),
                        ),
                      )),
                  Text('عيادات',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w100,
                        color: Colors.black45,
                      )),
                ],
              ),
            ),
            widget1(
                '     اسم الطبيب',
                controller.data[index]['ReferringPhysician'],
                Icons.co_present_outlined),
            //widget1('اسم القسم', ' القلبية', Icons.recent_actors_outlined),

            if (controller.data[index]['BodyHeat'] != null)
              widget1('            الحرارة',
                  controller.data[index]['BodyHeat'].toString(), Icons.edit)
            else
              widget1('            الحرارة', "-", Icons.edit),
            widget1('            الضغط', controller.data[index]['Pressure'],
                Icons.edit),

            widget1('             النبض', controller.data[index]['Heartbeat'],
                Icons.edit),
            widget1('القصة السريرية', controller.data[index]['ClinicalStory'],
                Icons.edit),
            widget1('الفحص السريري ',
                controller.data[index]['ClinicalExamination'], Icons.edit),
            widget1('التشخيص و العلاج', controller.data[index]['Comments'],
                Icons.edit),

            SizedBox(
              height: 20,
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget makhbar(int index) {
    return Column(
      children: [
        Text('مخبر',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w100,
              color: Colors.black45,
            )),
        Expanded(
          child: ListView.builder(
            itemCount: controller.data[index]['x_ray'].length,
            itemBuilder: (context, index2) {
              return Column(
                children: [
                  widget1(
                      'أسم التحليل ',
                      controller.data[index]['laboratory_test_results'][index2]
                      ['NameIMG'],
                      Icons.edit_note_sharp),
                  widget1(
                      'التفاصيل ',
                      controller.data[index]['laboratory_test_results'][index2]
                      ['Details'],
                      Icons.insert_drive_file_outlined),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget ashaa(int index) {
    return Column(children: [
      Text('أشعة',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w100,
            color: Colors.black45,
          )),
      Expanded(
        child: ListView.builder(
          itemCount: controller.data[index]['x_ray'].length,
          itemBuilder: (context, index2) {
            return Column(
              children: [
                widget1(
                    'أسم التحليل ',
                    controller.data[index]['laboratory_test_results'][index2]
                    ['NameIMG'],
                    Icons.edit_note_sharp),
                widget1(
                    'التفاصيل ',
                    controller.data[index]['laboratory_test_results'][index2]
                    ['Details'],
                    Icons.insert_drive_file_outlined),
              ],
            );
          },
        ),
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }
}
