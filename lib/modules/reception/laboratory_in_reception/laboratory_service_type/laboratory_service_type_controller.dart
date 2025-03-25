
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/laboratory_in_reception/laboratory_service_type/laboratory_service_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Laboratory_service_type_controller extends GetxController{
  Laboratory_service_type_services services = Laboratory_service_type_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  late int id_section;


  late String id_patient;
  List data_details=[];
  List test_data_2=[];
  List test_data_det=[];
  List data_details_2=[];
  get_all_type_of_section() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_type_of_section(id_section);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("response from get all section controller");
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد تحاليل لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد تحاليل لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  checkinput() async{
    // var formdata=formstate.currentState;
    // if(formdata!.validate()){
    await get_patient_details();
    get_previous_medical();

    // }else{
    //   print("الحقول غير صالحة");
    // }
  }



  get_patient_details() async {
    statusRequest = StatusRequest.loading;
    update();
    print("wwaaaarning ${id_patient}");
    var response = await services.get_patient_details(id_patient);
    test_data_det.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_det.isNotEmpty) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      // Get.toNamed("/patient_details");
    }
    else if(test_data_det.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد بيانات لعرضها",
      );

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


  get_previous_medical() async {
    print ("here get previous medical and id patient record is ${data_details[0]['id']}");
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_previous_medical_condition(data_details[0]['id']);
    test_data_2.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_2.isNotEmpty) {
      data_details_2.clear();
      data_details_2.addAll(response['data']) ;
      print("previous medical is ${data_details_2}");
      Get.toNamed("/Patient_details_from_search");
    }
    else if(test_data_2.isEmpty) {
      Get.snackbar(
        "تحذير",
        "تعذر عرض البيانات لعدم إضافة عوارض سابقة ",
      );

    }
    else if (StatusRequest.failure == statusRequest) {
      Get.snackbar(
        "تحذير",
        "لا يوجد عوارض سابقة لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }

  @override
  void onInit() {
    id_section=Get.arguments['id_section'];
    get_all_type_of_section();

    super.onInit();
  }
}