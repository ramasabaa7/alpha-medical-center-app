

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/Home/homeNurseController.dart';
import 'package:project_after_update/modules/Nurse/Nurse_wait_patient/Nurse_wait_patient_controller.dart';

class ListPatients extends StatelessWidget {
  const ListPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeNurseController controller= Get.put<homeNurseController>(homeNurseController());
    return  GetBuilder<homeNurseController>(builder: (controller){
      return Flexible(
          child: ListView.builder(
              itemCount: controller.data_names.length,
              itemBuilder: (BuildContext contex, int index) {
                return Listpatients(
                  index: index,
                );
              }));
    });
  }
}

class Listpatients extends StatelessWidget {
  final int index;


  const Listpatients({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeNurseController controller= Get.put(homeNurseController());
    Nurse_wait_patient_controller controller2= Get.put(Nurse_wait_patient_controller());
    return GetBuilder<homeNurseController>(builder: (controller){
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: GestureDetector(
          onTap: () {
            //  controller.data4.clear();
            controller2.refresh();
            controller2.get_allwaitingPatient(controller.data_num[index]);

            Get.toNamed("/Nurse_wait_patient",
              //     arguments: {
              //     //  "id" : controller.data[0]['id']
              // }
            );

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
                  Text("${controller.data_names[index]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),
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
    });

  }
}
