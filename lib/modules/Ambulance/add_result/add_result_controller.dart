import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/add_result/add_result_services.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_result_controller extends GetxController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String Pressure;
  late String Heartbeat;
  late String BodyHeat;
  late String ClinicalStory;
  late String ClinicalExamination;
  late int id;
  Add_result_services services =Add_result_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var token;
  String? Function(String?)? valid;



  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_result();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_result() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_resault(Pressure,Heartbeat,BodyHeat,ClinicalStory,ClinicalExamination,id);
    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest) {
      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية إرفاق النتيجة بنجاح",);
    }

    else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تحذير", "هذا الرقم الوطني موجود بالفعل",);
    }

    else{
      Get.defaultDialog(title: " خطأ ",content:Text("حدث خطأ ما"));
    }
    update();
  }
  @override
  void onInit() {
   id = Get.arguments['id'];
  }
}