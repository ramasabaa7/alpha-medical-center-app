import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Patient_details_controller extends GetxController {
  Patient_details_services services = Patient_details_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
   late String id_patient;
   List data_details=[];
  List test_data_2=[];
  List test_data=[];
  List data_details_2=[];
 // GlobalKey<FormState> formstate= GlobalKey<FormState>();
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
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data_details.clear();
      data_details.addAll(response['data']) ;
     // Get.toNamed("/patient_details");
    }
    else if(test_data.isEmpty) {
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
      Get.toNamed("/patient_details");
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
}
