import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/modules/reception/add_record/add_record_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Patient_Regesteration_controller extends GetxController{

  String selected="يوجد";
  List<String> department=[
    "يوجد",
    "لايوجد"
  ];
  changedepartment(String value){
    selected=value;
    update();
  }



  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String idpersonal;
  late String fullname;
  late String age;
  late String phonenumber;
  late String addres;
  late String ambulancecase;
  Patient_Regesteration_services services =Patient_Regesteration_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_record();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_record() async{
    if(selected=="يوجد"){
      ambulancecase="1";
    }else{
      ambulancecase="0";
    }
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_patient_record(idpersonal,fullname,age,phonenumber,addres,ambulancecase);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

        await Get.snackbar("تم الإضافة بنجاح", "تمت عملية إضافة السجل بنجاح",);
        print("the id of patient${response['FullName']} is ${response['id']}");
        Get.offNamed("/Add_Previous_medical_cond",arguments: {
          "id":response['id']
        });



    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تحذير", "هذا الرقم الوطني موجود بالفعل",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة السجل الطبي "));

    }
    update();

  }
}