import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Notification_services {
  String bearer = "Bearer";
  Crud crud;

  Notification_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_salary_increase_request(String Details) async {
    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(Serverconfig.add_salary_increase_from_reception, {
      "Details": "${Details}",

    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    return response.fold((l) => l, (r) => r);
  }

}