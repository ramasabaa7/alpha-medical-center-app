

import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Ambulance_visit_registration_services {
  String bearer = "Bearer";
  Crud crud;
  Ambulance_visit_registration_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  visit_registration(int IDPatientRecord, String title, String ReferringPhysician,) async {
    String? token = await secury.read("ambulance_token");
    var response = await crud.postdata(Serverconfig.visit_registration, {
      "IDPatientRecord": "${IDPatientRecord}",
      "Title": "${title}",
      "ReferringPhysician": "${ReferringPhysician}"

    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("message");
    print(response);
    message=response;
    return response.fold((l) => l, (r) => r);
  }
}
