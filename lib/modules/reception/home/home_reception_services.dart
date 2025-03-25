
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Home_reception_services {

  String bearer = "Bearer";
  Crud_get crud;

  Home_reception_services(this.crud);
  Secury_storage secury1 = new Secury_storage();

  get_all_section() async {
    String? token = await secury1.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_section_in_manager,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_patient_details(id_patient) async {

    String? token = await secury1.read("receptionist_token");
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

    String? token = await secury1.read("receptionist_token");

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