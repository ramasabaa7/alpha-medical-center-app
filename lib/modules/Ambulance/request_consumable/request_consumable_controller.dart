import 'package:get/get.dart';

class Request_consumable_controller extends GetxController{
  List<String> center_services = [
    "معاينة",
    "صورة شعاعية",
    "تحليل دم",
    "تحليل بول",
    "ايكو بطن و حوض",
    "ايكو مفصل"
  ];

  Rx<List<String>> selectedoptionlist_centerservices = Rx<List<String>>([]);
  var selectedoption_centerservices = "".obs;
}