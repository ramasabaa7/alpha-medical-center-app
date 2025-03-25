import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_details/ambulance_patient_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Ambulance_Patient_details_controller extends GetxController {
  Ambulance_Patient_details_services services = Ambulance_Patient_details_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List data_details_2=[];
  late String id_patient;
  //GlobalKey<FormState> formstatenew= GlobalKey<FormState>();

  // checkinput()async{
  //  // var formdata=formstatenew.currentState;
  //  // if(formdata!.validate()){
  //     await get_patient_details();
  //     get_previous_medical_ambulance();
  // //  }else{
  //   //  print("الحقول غير صالحة");
  //   }
  // }
  checkinput()async{


      await get_patient_details();
      get_previous_medical_ambulance();


  }

  get_patient_details() async {
    statusRequest = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest}");
    var response = await services.get_patient_details(id_patient);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data.clear();
      data.addAll(response['data']) ;
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_previous_medical_ambulance() async {
    print ("here get previous medical and id patient record is ${data[0]['id']}");
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_previous_medical_condition_ambulance(data[0]['id']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details_2.clear();
      data_details_2.addAll(response['data']) ;
      print("previous medical is ${data_details_2}");
      Get.toNamed("/Ambulance_patients_details");
    }
    // else if(test_data_2.isEmpty) {
    //   await Get.snackbar(
    //     "تحذير",
    //     "لا يوجد بيانات لعرضها",
    //   );
    //
    // }
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
}
