import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import 'addvisitservice.dart';
class Addvisitcontrollerlab extends GetxController
{
  var details ;
  var lab_type ;
  var path ;
  var signinstatus =false;
  var textEditingController = TextEditingController();
  var errorText = ''.obs;
  var message ;
  late String name ;
  late int id_requrd;
  late int id_visit;
  late int id_patient;
  StatusRequest? statusRequest;
  addvisitlab service = addvisitlab(Get.find());
  void validate(String value, String Function(String) validator) {
    errorText.value = validator(value);
  }


  var text =''.obs;
  @override
  onInit() {

    id_requrd=Get.arguments['RequiredPatientID'];
    id_visit =Get.arguments['patient_visit_details_id'];
    name =Get.arguments['Name'];
    id_patient =Get.arguments['IDPatientRecord'];

    super.onInit();
  }


    Future <void> uploadonclick() async {
      statusRequest = StatusRequest.loading;
      update();
      print(id_patient);
      print(id_requrd);
      var response = await service.uploadtest(details,id_patient , id_requrd, 1);
      statusRequest = handlingdata(response);

      if (StatusRequest.succes == statusRequest) {
        Get.defaultDialog(title: "تنبيه",content:Text("تم إرفاق التحليل بنجاح"));

      }
      else{
        Get.defaultDialog(title: "حدث خطأ ما",content:Text("اسم المستخدم أو كلمة المرور خطا"));
      }
    }

}