
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class wating_in_clinics_services {
  String bearer = "Bearer";
  Crud_get crud;
  wating_in_clinics_services(this.crud);
  Secury_storage secury = new Secury_storage();

  get_wating_request(int id_type_service) async {
    String? token = await secury.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_wating_request_by_typeservice+"?types_of_center_services_id=${id_type_service}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get wating request");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_all_doctors(int id) async {
    String? token = await secury.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.getalldoctor_in_type_service+"?id=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_all_services_in_type(int id_type) async {
    String? token = await secury.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_services_in_type_center+"?id=${id_type}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
