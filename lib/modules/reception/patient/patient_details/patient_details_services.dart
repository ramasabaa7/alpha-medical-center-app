
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Patient_details_services {
  String bearer = "Bearer";
  Crud_get crud;
  Patient_details_services(this.crud);
  Secury_storage secury = new Secury_storage();

  get_patient_details(id_patient) async {

    String? token = await secury.read("receptionist_token");
    print("thhhhhhe tooooken from getinfo controller is ${token}");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_patient_info+"?Key=ID Personal&Value=${id_patient}",

        {
          "Authorization": bearer + " " + token.toString(),
           "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  get_previous_medical_condition(id_patient_record) async {

    String? token = await secury.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_pervious_medical_condition+"?IDPatientRecord=${id_patient_record}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

}

