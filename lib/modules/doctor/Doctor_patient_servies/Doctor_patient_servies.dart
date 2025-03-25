import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/doctor/Doctor_patient_servies/Doctor_patient_servies_controller.dart';
class Doctor_patient_servies extends StatelessWidget {

  Doctor_patient_servies_servie_controller controller_patient_servies = Get.put(Doctor_patient_servies_servie_controller());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              controller_patient_servies.showDetails.assignAll(List.filled(100, false));
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
            if (controller_patient_servies.data.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("لا يوجد خدمات ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
                ),
              )
            else
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
      itemCount:controller_patient_servies.data.length ,
      itemBuilder: (context, index) {
        return visit(index);
      },
    );
  }



  Widget visit(int index) {
    String createdAt = controller_patient_servies.data[index]['UpdatedRequiredPatientServices'];
    String date = '';
    String time = '';

    if (createdAt != null) {
      date = createdAt.substring(0, 10);
      time = createdAt.substring(12, 16);
    }

    return Obx(() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => controller_patient_servies.toggleDetails(index),
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

              if (controller_patient_servies.showDetails[index] )
                Column(
                  children: [
                    if ( controller_patient_servies.data != null && controller_patient_servies.data.length > 0) service(index),
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

  Widget service(int index) {
    return Column(
      children: [

        Column(
          children: [
            widget1('أسم الخدمة ', controller_patient_servies.data[index]['ServiceName'],
                Icons.edit_note_sharp),
            widget1('تفاصيل الخدمة', controller_patient_servies.data[index]['ServiceDetails'], Icons.home_repair_service_outlined),
            widget1('سعر الخدمة  ', '${controller_patient_servies.data[index]['ServicePrice']}', Icons.monetization_on_outlined),
          ],
        ),


        SizedBox(
          height: 20,
        )
      ],
    );
  }


}