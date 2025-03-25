import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Convert_request_services {
  String bearer = "Bearer";
  Crud crud;
  Crud_get crud_get;
  Convert_request_services(this.crud,this.crud_get);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_service_for_patient(int id_visit, int id_service) async {
    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(Serverconfig.add_service_for_patient, {
      "patient_visit_details_id": "${id_visit}",
      "center_service_id": "${id_service}",
      "Status": "1",
      "patientbooking_id":""

    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("message");
    print(response);
    message=response;
    return response.fold((l) => l, (r) => r);
  }

  get_all_center_service() async {

    String? token = await secury.read("receptionist_token");
    var response = await crud_get.postdata(
        Serverconfig.get_all_available_service,

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