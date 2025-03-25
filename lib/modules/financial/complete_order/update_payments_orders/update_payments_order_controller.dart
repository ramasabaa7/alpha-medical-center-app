import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/complete_order/update_payments_orders/update_payments_order_services.dart';
import 'package:project_after_update/modules/financial/insurance_company/add_insurance_company/add_insurance_company_services.dart';
import 'package:project_after_update/modules/financial/maintenance/add_maintenance_request/add_maintenance_request_services.dart';
import 'package:project_after_update/modules/financial/maintenance/edit_maintenance_request/edit_maintenance_request_services.dart';
import 'package:project_after_update/modules/financial/maintenance/payments_for_maintenance/update_payments_maintenance/update_payments_maintenance_services.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/add_service_type_for_reception/add_serive_type_rec_services.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/add_x_ray/add_x_ray_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class update_payments_orders_controller extends GetxController{


  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  late String price;
  late String details;
  late var order_id;
  update_payments_orders_services services =update_payments_orders_services(Get.find());
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
      update_payments_maintenance();
    }else{
      print("الحقول غير صالحة");
    }
  }

  update_payments_maintenance() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.update_payments_maintenance(id,order_id,name,price,details);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية تعديل المدفوعات بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تعديل المدفوعات ",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تعديل  المدفوعات"));

    }
    update();

  }
  @override
  void onInit() async{
    id=Get.arguments['id'];
    order_id=Get.arguments['order_id'];
    print("hello the id is ${id}");
    super.onInit();
  }
}