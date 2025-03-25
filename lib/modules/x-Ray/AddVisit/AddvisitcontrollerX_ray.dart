import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static_colors/StaticColors.dart';
import 'Add_visit_service.dart';

class AddvisitcontrollerX_ray extends GetxController
{
  var details ;
  var path ;
  var signinstatus =false;
  var textEditingController = TextEditingController();
  var errorText = ''.obs;
  var message ;
  late String name ;
  late int id_requrd;
  late int id_visit;
  late int id_patient;
  Add_visit_service service = Add_visit_service();
  void validate(String value, String Function(String) validator) {
    errorText.value = validator(value);
  }


  var text =''.obs;


  Future <void> uploadonclick() async{

    signinstatus = await service.upload(path,details,id_visit,id_requrd);
    message=service.message;
    Get.defaultDialog(title: "تأكيد ارفاق الصورة",content:Text("تم إرفاق الصورة بنجاح"));
    if(message is List){
      String temp='';
      for(String s in message){
        temp+=s +'\n';
        message=temp;
      }
    }

  }

  @override
  onInit() {

    id_requrd=Get.arguments['RequiredPatientID'];
    id_visit =Get.arguments['patient_visit_details_id'];
    name =Get.arguments['Name'];
    id_patient =Get.arguments['IDPatientRecord'];

    super.onInit();
  }


}