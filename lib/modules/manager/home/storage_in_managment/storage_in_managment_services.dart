import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class Storage_in_managment_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  Crud_delete crud_delete;
  Storage_in_managment_services(this.crud, this.crud_put,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_all_material_in_center() async {
    String? token = await secury.read("admin_token");

    var response = await crud.postdata(
        Serverconfig.get_all_material_in_center, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_all_user(int section_id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_user_in_section+"?section_id=${section_id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_all_type_of_section(int id_section) async {
    String? token = await secury.read("admin_token");

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
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  delete_type(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.delete_type_center_services,
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
