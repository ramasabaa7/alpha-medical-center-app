import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/doctor/Doctor_patient_servies/Doctor_patient_servies_controller.dart';
import 'package:project_after_update/modules/doctor/record/patientVisitRecordController.dart';
import 'package:project_after_update/modules/doctor/Home/homeController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';


class patientList extends StatelessWidget {
  final homeController controller ;
  const patientList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //homeController controller = Get.find();
    return controller.statusRequest == StatusRequest.loading?
    Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
      Flexible(
        child: ListView.builder(
            itemCount: controller.data.length,
           // itemCount:3,

            itemBuilder: (BuildContext contex, int index) {
              return Listpatients(
                index: index,
                controller : controller
              );
            }));
  }

}

class Listpatients extends StatelessWidget {
  final int index;
  final homeController controller ;
  const Listpatients({Key? key, required this.index,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //homeController controller = Get.put(homeController());
    patientVisitRecordController patientVisitRecord =Get.put(patientVisitRecordController());
    Doctor_patient_servies_servie_controller Doctor_patient_servies = Get.put(Doctor_patient_servies_servie_controller());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: ()  async {
          print("${controller.data[index]['IDPatientRecord']}");
          print("xxxxxxxxxxxxxxxxxxxx");
        await patientVisitRecord.get_patient_visits(controller.data[index]['IDPatientRecord']);
          await patientVisitRecord.get_patient_info(controller.data[index]['IDPatientRecord']);
          await Doctor_patient_servies.get_patient_services(controller.data[index]['IDPatientRecord']);
      //   await patientVisitRecord.get_patient_visits(17);
          Get.toNamed("/patientVisitRecord"
           // ,
              // arguments: {
              // "id" :controller.data[index]['IDPatientRecord'].toString(),


           //   }
          );

        },

      child: Container(
          clipBehavior: Clip.antiAlias,

           decoration: BoxDecoration(
             color: Color(0xffffffff),
             border: Border.all(color:    Color(0xffe0e8ff),width: 2),

            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // IconButton(
                //   color:  Color(0xff9bb4fd),
                //   icon: Icon(
                //     Icons.delete,
                //     size: 30,
                //   ),
                //   onPressed: () {
                //     //   itemDetailsController.add()
                //
                //   },
                // ),
             //   Text("${s[index]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),
              //  if (controller.data.isNotEmpty)
                IconButton(
                  color: Color(0xff9bb4fd),
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  onPressed: () {
                    controller.complet(controller.data[index]['IDPatientRecord']);
                  },
                ),
                Row(
                  children: [
                    Text(" (  ${controller.data[index]['ServiceName']}  )        " ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,fontFamily: 'Arial',color: Colors.grey[900])),
                    Text(controller.data[index]['FullName'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),

                  ],
                ),
                Icon(
                  Icons.person,
                  size: 30,
                  color: Color(0xff9bb4fd),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
