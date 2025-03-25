
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Ambulance_Patient_visits_details_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_delete crud_delete;
  Ambulance_Patient_visits_details_services(this.crud,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_patient_visits_details(int id) async {
    String? token = await secury.read("ambulance_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_patient_visits_details + "?id=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  ///////////////////////////////////////////////////////////////
  delete_patient_visits_details(int id) async {
    String? token = await secury.read("ambulance_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.delete_preview_reult,
        {
          "id" : "${id}"
        },

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
