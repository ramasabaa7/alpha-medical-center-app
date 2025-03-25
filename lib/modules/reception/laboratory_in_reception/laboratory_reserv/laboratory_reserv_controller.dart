import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Laboratory_reserv_controller extends GetxController{
  DateTime today =DateTime.now();
  TimeOfDay time1 =TimeOfDay.now();
  void ondayselected(DateTime day,DateTime focusedday){
    today=day;
    update();
  }
  void ontimechanged(TimeOfDay time){
    time1=time;
    update();
  }
  List<String> center_services = [
    "تحليل T3",
    " تحليل TSH",
    "تحليل T4",
    "تحليل كريات دم حمراء",
  ];
  Rx<List<String>> selectedoptionlist_centerservices = Rx<List<String>>([]);
  var selectedoption_centerservices = "".obs;
}