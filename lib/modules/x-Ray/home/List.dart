import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';

import '../../../static_colors/StaticColors.dart';
import 'PatientList.dart';
import 'PatientListcontroller.dart';


class List extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Get.put(PatientListController());
    return GetBuilder<PatientListController>(builder: (controller) {

      return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            '${controller.name}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
  body:  Column(

    children: [

      ListPatientsx_ray(controller: controller,),
    ],
  ),
    );});
  }



}
