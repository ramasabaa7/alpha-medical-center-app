

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../static_colors/StaticColors.dart';
import 'PatientListcontroller.dart';
import 'homeX-RayController.dart';



class ListPatientsx_ray extends StatelessWidget {
  final PatientListController controller ;
  const ListPatientsx_ray( {Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.statusRequest == StatusRequest.loading?
    Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
      Flexible(
        child: ListView.builder(
            itemCount: controller.data_details.length,
            itemBuilder: (BuildContext contex, int index) {
              return Listpatients(
                index: index,
                controller: controller,
              );
            }));
  }
}

class Listpatients extends StatelessWidget {
  final int index;
  final PatientListController controller ;

  const Listpatients({Key? key, required this.index,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          print(controller.data_details3);
          Get.toNamed('/Addvisitx_ray',arguments: {
            "RequiredPatientID" : controller.data_details[index]['RequiredPatientID'],
            "IDPatientRecord" : controller.data_details[index]['IDPatientRecord'],
            "patient_visit_details_id" : controller.data_details[index]['patient_visit_details_id'],
            "Name" : controller.data_details[index]['FullName']


          });
          print(controller.data_details3);

        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Color(0xff9bb4fd),
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  onPressed: () {
                    //   itemDetailsController.add()

                  },
                ),
                Text('${controller.data_details[index]['FullName']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),
                IconButton(
                  color:Color(0xff9bb4fd),
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  onPressed: () {
                    //   itemDetailsController.add()

                  },
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
