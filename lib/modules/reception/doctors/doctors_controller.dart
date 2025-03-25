import 'package:get/get.dart';

class Doctors_controller extends GetxController {
  List<String> options = [
    "الأحد",
    "الإثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
  ];
  List<String> options_houer = [
    "12-2",
    "2-4",
    "4-6",
    "6-8",
    "8-10",
  ];
  Rx<List<String>> selectedoptionlist = Rx<List<String>>([]);
  Rx<List<String>> selectedoptionlist_houer = Rx<List<String>>([]);
  var selectedoption = "".obs;
  var selectedoption_houer = "".obs;
}
