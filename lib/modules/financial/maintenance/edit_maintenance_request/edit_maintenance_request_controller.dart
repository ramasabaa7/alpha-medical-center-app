import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/insurance_company/add_insurance_company/add_insurance_company_services.dart';
import 'package:project_after_update/modules/financial/maintenance/add_maintenance_request/add_maintenance_request_services.dart';
import 'package:project_after_update/modules/financial/maintenance/edit_maintenance_request/edit_maintenance_request_services.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/add_service_type_for_reception/add_serive_type_rec_services.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/add_x_ray/add_x_ray_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class update_maintenance_request_controller extends GetxController{


  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  late int user_id;
  late String price;
  late String details;
  update_maintenance_request_services services =update_maintenance_request_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  late int id;
  String? Function(String?)? valid;
  List test_data_info=[];
  List data_info=[];
  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      update_maintenance_request();
    }else{
      print("الحقول غير صالحة");
    }
  }

  update_maintenance_request() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.update_maintenance_request(id,user_id,name,price,details);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية ـعديل طلب الصيانة بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تعديل طلب الصيانة",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تعديل  طلب الصيانة"));

    }
    update();

  }
  get_myuser_info() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_my_user_info();
    test_data_info.addAll(response.values);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest && test_data_info.isNotEmpty) {
      data_info.clear();
      data_info.addAll(response.values);
      print("response from get all section controller");
      print(data_info);
    } else if (test_data_info.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد معلومات  لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد  معلومات  لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  @override
  void onInit() async{
    await get_myuser_info();
    user_id=data_info[0];
    id=Get.arguments['id'];
    super.onInit();
  }
}