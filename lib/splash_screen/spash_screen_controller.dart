import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Splash_controller extends GetxController {
  late Secury_storage secury_storage;
  @override
  void onInit() async{
    secury_storage= new Secury_storage();
    checktoken();
    super.onInit();
  }
  Future<void> checktoken() async{

    String? admin_token = await secury_storage.read("admin_token");
    String? doctor_token = await secury_storage.read("doctor_token");
    String? receptionist_token = await secury_storage.read("receptionist_token");
    String? ambulance_token = await secury_storage.read("ambulance_token");
    String? laboratory_token = await secury_storage.read("laboratory_token");
    String? xray_token = await secury_storage.read("xray_token");
    String? nurse_token = await secury_storage.read("nurse_token");
    String? finance_token = await secury_storage.read(("finance_token"));
    String? store_tokne = await secury_storage.read("Store_token");
   // String? receptionist_token = await secury_storage.read("receptionist_token");

    //if doctor_token = await secur.read(" doctor_token");
    print("tooookken from splaaaash");
      print(admin_token);

    if(admin_token!= null){
      Get.offAllNamed('/Home_screen_manager');
    }else if (doctor_token!=null){
      Get.offAllNamed("/FancyNavBarDoctor");
    }else if (receptionist_token!=null){
      Get.offAllNamed("/home_screen_reception");
    }else if (ambulance_token!=null){
      Get.offAllNamed("/home_screen_ambulance");
    }else if (laboratory_token!=null){
      Get.offAllNamed("/FancyNavBarlab");
    }else if (xray_token!=null){
      Get.offAllNamed("/FancyNavBarx_ray");
    }else if (nurse_token!=null){
      Get.offAllNamed("/FancyNavBarNurse");
    }else if (finance_token!=null){
      Get.offAllNamed("/navigationBar_financial");
    }
    else if (store_tokne!=null){
      Get.offAllNamed("/Home_screen_store");
    }
    else{
      Get.offAllNamed('/login');
    }


  }


}
