import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/x-Ray/VisitsListsX_Ray/personalinformationxrayservic.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import 'Visitlistservice.dart';
import 'deletvisitxray.dart';
class VisitsListControllerX_Ray extends GetxController{
  var showDetails = false.obs;
 late int id_requrd;
 late int id_patient;
  var id;
   var date =[];
  var Id_personal   ;
  String? name;
  var  age ;
  var  phon;
  var  address;
  var num ;
  var data_details2=[];
  var data_details=[];
  var data= [];
  StatusRequest? statusRequest2;
  StatusRequest? statusRequest;
  StatusRequest? statusRequest1;
  StatusRequest? statusRequest3;
  Visitlestservice visitlestservice = Visitlestservice(Get.find());
  personalinformationxray personalInformationService= personalinformationxray(Get.find());
  deletexray delete =deletexray(Get.find());
  void toggleDetails() {
    showDetails.value = !showDetails.value;
  }

  RxDouble imageSize = 100.0.obs;

  void changeImageSize(double scale) {
    imageSize.value = 100 * scale.clamp(0.5, 2.0);
  }

  void resetImageSize() {
    imageSize.value = 100.0;
  }

  var ashaa =true.obs ;
  @override
  void onInit() {

    id_requrd=Get.arguments['RequiredPatientID'];

    id_patient =Get.arguments['IDPatientRecord'];
    getvisitbyid(id_patient);

    super.onInit();}
  get_patieninfobytid(int id_type) async {
    statusRequest2 = StatusRequest.loading;
    update();

    var response = await personalInformationService.get_pationbyid(id_type);

    //test_data.addAll(response['data']);
    // print("test daaaataaa is ${test_data}");
    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {

      print(date);
      data_details2.clear();
      data_details2.add(response['data']) ;
      Get.toNamed('/PersonalInformationx_ray');

      print(data_details2);

    }

    else if (StatusRequest.failure == statusRequest2) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  getvisitbyid(int id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await visitlestservice.get_allvisitXray(id);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {




      data_details.clear();
      data_details.add(response['data']) ;
      data.clear();
      for(int i = 0; i < data_details[0].length; i++) {

        if (data_details[0][i]['x_ray'].length!=0){
          data.add(data_details[0][i]['x_ray']);
          String s = DateTime.parse(response['data'][0]['created_at']).toString();
          date.add(s.substring(0, 10)) ;

        }
      }
      print(date);
      print(data);

    }

    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  downloadxray(int id) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await visitlestservice.download_XRay(id);
    if (response!=null) {
      await Get.snackbar(
        "تنبيه",
        "تم تحميل الصورة بنجاح",
        backgroundColor: Colors.white,

      );

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_test(int id_test) async {
    statusRequest3 = StatusRequest.loading;
    update();

    var response = await delete.deletexraybyid(id_test);
    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {

      Get.defaultDialog(title: "", content: Text("تم حذف التحليل"));


    }

    else if (StatusRequest.failure == statusRequest3) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();





  }




}