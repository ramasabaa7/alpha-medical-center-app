import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_pervious_medical_services {
  String bearer = "Bearer";
  Crud crud;
  Add_pervious_medical_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_previous_medical(String diseasename, String details, int id_patient_record,) async {
    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(Serverconfig.add_pervious_medical_condition, {
      "DiseaseName": "${diseasename}",
      "Details": "${details}",
      "IDPatientRecord": "${id_patient_record}"

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
