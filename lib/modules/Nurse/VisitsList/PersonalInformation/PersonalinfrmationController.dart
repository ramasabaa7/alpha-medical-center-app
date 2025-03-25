
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/PersonalInformation/PersonalinfrmationServices.dart';
import 'package:flutter/widgets.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class PersonalinfrmationController extends GetxController {
  PersonalinfrmationServices services = PersonalinfrmationServices(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  late String id_patient;
  GlobalKey<FormState> formstate= GlobalKey<FormState>();



  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      get_patient_details();
    }else{
      print("الحقول غير صالحة");
    }
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
      Get.toNamed("/PersonalInformationN");
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
  RxBool showProfilePic = false.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // scrollController.addListener(() {
    //   if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
    //     showProfilePic.value = false;
    //   } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
    //     showProfilePic.value = true;
    //   }
    // });
  }
  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
