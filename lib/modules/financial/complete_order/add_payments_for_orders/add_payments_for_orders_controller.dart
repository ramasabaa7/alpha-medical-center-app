import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/complete_order/add_payments_for_orders/add_payments_for_orders_services.dart';
import 'package:project_after_update/modules/financial/insurance_company/add_insurance_company/add_insurance_company_services.dart';
import 'package:project_after_update/modules/financial/maintenance/add_maintenance_request/add_maintenance_request_services.dart';
import 'package:project_after_update/modules/financial/maintenance/payments_for_maintenance/add_payments_for_maintenance_req/add_payments_for_maintenance_req_services.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/add_service_type_for_reception/add_serive_type_rec_services.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/add_x_ray/add_x_ray_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Add_payments_orders_controller extends GetxController{


  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  late int order_id;
  late String price;
  late String details;
  Add_payments_orders_services services =Add_payments_orders_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  String? Function(String?)? valid;
  List test_data_info=[];
  List data_info=[];
  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_payments_maintenance_request();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_payments_maintenance_request() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.Add_payment_orders_request(order_id,name,price,details);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية إضافة واردات الطلب  بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إضافة واردات الطلب ",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة واردات  الطلب "));

    }
    update();

  }
  @override
  void onInit() async{
    order_id=Get.arguments['order_id'];
    super.onInit();
  }
}