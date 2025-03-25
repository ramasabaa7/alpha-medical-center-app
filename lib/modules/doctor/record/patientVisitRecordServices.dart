
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';


class patientVisitRecordServices{

  String bearer = "Bearer";
  Crud_get crud;
  Crud_get crud2;
  patientVisitRecordServices(this.crud,this.crud2);
  Secury_storage secury = new Secury_storage();

  get_patient_visits(int id) async {
    String? token = await secury.read("doctor_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_patient_visits + "?IDPatientRecord=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_patient_info(int id) async {
    String? token = await secury.read("doctor_token");


    var response = await crud2.postdata(
        Serverconfig.get_Patient_Information_ByID + "?id=${id}",

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