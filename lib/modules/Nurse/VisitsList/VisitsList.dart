import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/Nures_patiient_services_list/Nures_patiient_services_list_controller.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/Nurse_visit_ditails/Nurse_visit_ditailsController.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/PersonalInformation/PersonalinfrmationController.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/VisitsListController.dart';
import 'package:project_after_update/modules/doctor/record/PersonalInformationD.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'dart:ui';

class VisitsList extends StatelessWidget {
  VisitsListController controller = Get.put(VisitsListController());
  PersonalinfrmationController personalinfrmationController = Get.put(PersonalinfrmationController());
  Nurse_visit_ditailsController nurse_visit_ditailsController = Get.put(Nurse_visit_ditailsController());
  Nures_patiient_services_list_controller nures_patiient_services_list_controller = Get.put(Nures_patiient_services_list_controller());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              nures_patiient_services_list_controller.showDetails.assignAll(List.filled(100, false));
              Get.back();
            },
          ),
          iconTheme: IconThemeData(

              color: Colors.black54,size: 28),
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Color(0xff9bb4fd),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Expanded(
                child: Text(
                  'خدمات المريض',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 22, color: Colors.black54),
                ),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        body:Column(
          children: [
            SizedBox(height: 15),
            // add some space between the title and the icon
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap:() async{
              print("iddddd");

              await controller.get_patient_info(controller.data[0]['IDPatientRecord']);
              Get.toNamed("/PersonalInformationN");


              },
                child: Container(
                  color:Color.fromARGB(100, 189, 189, 189).withAlpha(50),
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
                onTap:  () async{
                  print("iddddd");

                  await nures_patiient_services_list_controller.get_patient_services(controller.data[0]['IDPatientRecord']);
                  Get.toNamed("/Nures_patiient_services_list");


                },
                child: Container(
                  color:Color.fromARGB(100, 189, 189, 189).withAlpha(50),
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
              child: Expanded(
                  child:
                  _buildEmployeeList()

              ),
            ),
          ],
        )

    );
  }

  Widget _buildEmployeeList() {
    return ListView.builder(
      itemCount:controller.data.length ,
      itemBuilder: (context, index) {
        return visit(index);
      },
    );
  }



  Widget visit(int index) {
    String createdAt =  controller.data[index]['updated_at'];
    String date = '';
    String time = '';

    if (createdAt != null) {
      date = createdAt.substring(0, 10);
      time = createdAt.substring(12, 16);
    }

    return Obx(() => Padding(
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
                    if (!controller.doctor.value) doctor(index),
                     if (controller.data[index]['x_ray'] != null && controller.data[index]['x_ray'].length > 0) ashaa(index),
                    if (controller.data[index]['laboratory_test_results'] != null && controller.data[index]['laboratory_test_results'].length > 0) makhbar(index),
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
                child: Center(child: Text('    ' + '_', maxLines: null, textAlign: TextAlign.center)),
              ),

            SizedBox(
              width: 0,
            ),
            Center(child: Text('  :  ' + '${s1}', maxLines: null, textAlign: TextAlign.center)),
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
            widget1('     اسم الطبيب', controller.data[index]['ReferringPhysician'], Icons.co_present_outlined),
            //widget1('اسم القسم', ' القلبية', Icons.recent_actors_outlined),

            if (controller.data[index]['BodyHeat']!=null)
            widget1('            الحرارة', controller.data[index]['BodyHeat'].toString(), Icons.edit)
            else
              widget1('            الحرارة', "-", Icons.edit),
            widget1('            الضغط', controller.data[index]['Pressure'], Icons.edit),

            widget1('             النبض',controller.data[index]['Heartbeat'], Icons.edit),
            widget1('القصة السريرية',controller.data[index]['ClinicalStory'], Icons.edit),
            widget1('الفحص السريري ', controller.data[index]['ClinicalExamination'], Icons.edit),
            widget1('التشخيص و العلاج', controller.data[index]['Comments'], Icons.edit),

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

              return  Column(

                children: [

               //   widget1('أسم التحليل ', controller.data[index]['laboratory_test_results'][index2]['NameIMG'],Icons.edit_note_sharp),
                 // widget1('التفاصيل ', controller.data[index]['laboratory_test_results'][index2]['Details'], Icons.insert_drive_file_outlined),
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

            return  Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        'تحميل',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9bb4fd),
                        ),
                      )),
                ),
                widget1('أسم الصورة ', controller.data[index]['x_ray'][index2]['NameIMG'], Icons.edit_note_sharp),
                widget1('التفاصيل ', controller.data[index]['x_ray'][index2]['Details'], Icons.insert_drive_file_outlined),
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