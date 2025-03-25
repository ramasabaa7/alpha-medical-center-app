import 'package:get/get.dart';

class Wating_in_laboratory_controller extends  GetxController{
  late int id_section;
  @override
  void onInit() {
    id_section=Get.arguments['id_section'];
    super.onInit();
  }
}