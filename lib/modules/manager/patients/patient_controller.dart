import 'package:get/get.dart';
class Patient_controller extends GetxController{
  bool droped =false;
  ontapdropdown(bool droped){
    this.droped=!droped;
    update();
  }
}