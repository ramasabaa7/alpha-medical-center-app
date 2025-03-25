import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Lab/VisitListLab/visitlistservice.dart';
import 'package:project_after_update/modules/x-Ray/VisitsListsX_Ray/personalinformationxrayservic.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import 'PersonallinformationServec.dart';
import 'deletetastservice.dart';

class VisitsListControllerlab extends GetxController{
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
  deletetest delete =deletetest(Get.find());
  Visitlestservicelab visitlestservice = Visitlestservicelab(Get.find());
  personalinformationlab personalInformationService= personalinformationlab(Get.find());
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
    print(id_patient);
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
      Get.toNamed('/PersonalInformationlab');

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

        if (data_details[0][i]['laboratory_test_results'].length!=0){
          data.add(data_details[0][i]['laboratory_test_results']);
          print('mMMMMMMmmmm');
          print(data_details);
          String s ='2023-8-15';
          //String s1 = DateTime.parse(data_details[0][i]['created_at']).toString();
         // date.add(s.substring(0, 10)) ;
          date.add(s);

        }
      }
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
  delete_test(int id_test) async {
    statusRequest3 = StatusRequest.loading;
    update();

    var response = await delete.deletetestbyid(id_test);
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