
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';


class Doctor_patient_servies_servie{

  String bearer = "Bearer";
  Crud_get crud;
  Doctor_patient_servies_servie(this.crud);
  Secury_storage secury = new Secury_storage();

  get_patient_visits(int id) async {
    String? token = await secury.read("doctor_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_Patient_Services + "?IDPatientRecord=${id}",

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