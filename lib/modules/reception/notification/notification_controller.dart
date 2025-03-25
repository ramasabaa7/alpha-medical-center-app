import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/notification/notification_services.dart';
import 'package:project_after_update/modules/reception/patient/convert_request/convert_request_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class notification_controller extends GetxController {

  Notification_services services =
  Notification_services(Get.find(),);
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  String? Function(String?)? valid;
  late String details;
   GlobalKey<FormState> formstate= GlobalKey<FormState>();
  checkinput() async{
    var formdata=formstate.currentState;
    if(formdata!.validate()){

add_salary_increase();
    }else{
      print("الحقول غير صالحة");
    }
  }
  add_salary_increase() async {

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_salary_increase_request(details);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الطلب بنجاح", "تمت عملية تقديم الطلب  بنجاح",);




    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تقديم  الطلب بنجاح",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تفديم  الطلب بنجاح "));
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
