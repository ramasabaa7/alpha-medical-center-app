import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/reception/home/home_reception.dart';
import 'package:project_after_update/modules/reception/patient/patient.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../Needs/NeedProductsstore.dart';
import '../Orders/departmentorders.dart';
import '../Trash/TrashProductsstore.dart';
import '../matireials/Pharmaceutical.dart';
import 'archiveservice.dart';
import 'home_store.dart';

class Home_screen_store_controller extends GetxController{
  int currentpage=0;
  archiveServic servic3= archiveServic(Get.find());
  var data_details3 =[];
  StatusRequest? statusRequest3 ;
  List<Widget> listpage=[
    home_store(),
    department_orders(),
    need_Products(),
    Trash_Products(),

  ];
  changepage(int i){
    currentpage=i;
    update();
  }


}