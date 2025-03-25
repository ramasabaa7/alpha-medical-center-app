import 'package:get/get.dart';

class Convert_request_in_ambulance_controller extends GetxController{
  List<String> center_services = [
    "معاينة",
    "صورة شعاعية",
    "تحليل دم",
    "تحليل بول",
    "ايكو بطن و حوض",
    "ايكو مفصل"
  ];
  List<String> center_department = [
    "قسم الأشعة",
    " قسم المخبر",
    "العيادة العظمية",
    " قسم الإسعاف",
  ];
  Rx<List<String>> selectedoptionlist_centerservices = Rx<List<String>>([]);
  var selectedoption_centerservices = "".obs;
  Rx<List<String>> selectedoptionlist_centerdepartment = Rx<List<String>>([]);
  var selectedoption_centerdepartment = "".obs;
}