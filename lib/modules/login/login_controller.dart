import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Login_controller extends GetxController{
 // GlobalKey<FormState> formstate3= GlobalKey<FormState>();
  late String username;
  late String password;
  Login_services services =Login_services(Get.find());
   StatusRequest? statusRequest;
  Secury_storage secury_storage3 = new Secury_storage();
   late var admin_token;
  late var doctor_token;
  late var receptionist_token;
  late var ambulance_token;
  late var laboratory_token;
  late var xray_token;
  late var nurse_token;
  late var finance_token;
  late var stor_token;
  String? Function(String?)? valid;



  login() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.login(username.toString(),password.toString());
    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest && response['data']!=""){

      if(response['code']== 1 && response['data']['user']['TypeUser'] == "Administration" ){
        // && response['carer']=='reception'
        admin_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("admin_token", admin_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);

        Get.offAllNamed("/Home_screen_manager");


      }
      else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Manager" ){
        // && response['carer']=='reception'
        admin_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("admin_token", admin_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/Home_screen_manager");
      }
      else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Doctor" ) {
        // && response['carer']=='reception'
        doctor_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("doctor_token", doctor_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.toNamed("/FancyNavBarDoctor");
      }
      else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Receptionist" ) {
        // && response['carer']=='reception'
        receptionist_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("receptionist_token", receptionist_token);
        FirebaseMessaging.instance.subscribeToTopic("reception");
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/home_screen_reception");
      }
      else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Ambulance" ) {
        // && response['carer']=='reception'
        ambulance_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("ambulance_token", ambulance_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/home_screen_ambulance");
      } else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Laboratory" ) {
        // && response['carer']=='reception'
        laboratory_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("laboratory_token", laboratory_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/FancyNavBarlab");
      }
      else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Radiographer" ) {
        // && response['carer']=='reception'
        xray_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("xray_token", xray_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/FancyNavBarx_ray");
      }
      else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Nurse" ) {
        // && response['carer']=='reception'
        nurse_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("nurse_token", nurse_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/FancyNavBarNurse");
      }  else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Finance" ){
        // && response['carer']=='reception'
        finance_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("finance_token", finance_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/navigationBar_financial");
      } else if(response['code']== 1 && response['data']['user']['TypeUser'] == "Store" ) {
        // && response['carer']=='reception'
        stor_token=response['data']['token'];
        print("tesst from login");
        secury_storage3.save("Store_token", stor_token);
        await Get.snackbar("تسجيل دخول ناجح", "تمت عملية الدخول بنجاح",);
        Get.offAllNamed("/Home_screen_store");
      }

      else{
        statusRequest=StatusRequest.failure;
      }

    }else if (StatusRequest.succes==statusRequest && response['code']==1 && response['data']==""){
      Get.snackbar( "تنبيه","يرجى الإنتظار حتى يتم قبول الطلب من قبل المدير");
    }else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("اسم المستخدم أو كلمة المرور خطا"));
    }
    update();
  }
}