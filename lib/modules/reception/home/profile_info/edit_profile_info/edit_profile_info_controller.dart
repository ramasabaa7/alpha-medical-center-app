import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/home/profile_info/edit_profile_info/edit_profile_info_services.dart';
import 'package:project_after_update/modules/signup/signup_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Edit_profile_info_controller extends GetxController{


  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late var username;
  late var password;
  late var name;
  late var surname;
  late var email;
  late var pass_conf;




  Edit_profile_info_services services =Edit_profile_info_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  String? Function(String?)? valid;
  String? message;


  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      edit_profile_info();
    }else{
      print("الحقول غير صالحة");
    }
  }

  edit_profile_info() async{
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.edit_profil_info(username,password,name,surname,email,pass_conf);
    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){
      await Get.snackbar("تم", "تمت عملية تعديل معلومات الحساب بنجاح",);
      Get.offNamed("/Profile_info_reception");

    }else{
      message=response['message'];
      Get.defaultDialog(title: "تنبيه",content:Text("${message}"));
    }
    update();
  }
  @override
  void onInit()async{

    super.onInit();
  }


}





