import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Clinics_services {
  String bearer = "Bearer";
  Crud_get crud;
  Clinics_services(this.crud);
  Secury_storage secury = new Secury_storage();

  get_all_clinics(int id_section) async {
    String? token = await secury.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_type_section+"?id_section=${id_section}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from clinics services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
