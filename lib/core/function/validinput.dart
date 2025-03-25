import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "اسم مستخدم غير صالح";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "بريد غير صالح";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم هاتف غير صالح";
    }
  }
  if (val.length < min) {
    return " $minلا يمكن ان تكون القيمة أصغر من ";
  }
  if (val.length > max) {
    return " $maxلا يمكن ان تكون القيمة أكبر من ";
  }
  if (val.isEmpty) {
    return " لا يمكن ان تكون القيمة فارغة";
  }
}
