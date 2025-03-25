import 'package:get/get.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
class Binding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(Crud_get());
    Get.put(Crud_put());
    Get.put(Crud_delete());
    //// commit in binding
  }

}