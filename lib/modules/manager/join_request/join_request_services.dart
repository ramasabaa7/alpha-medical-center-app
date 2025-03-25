
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Join_request_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  Crud_delete crud_delete;
  Join_request_services(this.crud,this.crud_put,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_all_type_user() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_type_user,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  get_all_type_services_in_center() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_type_services_in_center,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from register get all section");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_all_roles() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_roles,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from register get all section");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_all_join_request() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_join_reqiest,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  accept_join(int id,int id_type_user,int id_TypeCenterServices,int id_role) async {
    print("from accept id_type_user is ${id_type_user}");
    String? token = await secury.read("admin_token");
    var response = await crud_put.postdata(Serverconfig.accept_join_request, {
      "id": "${id.toString()}",
      "id_TypeUser":"${id_type_user.toString()}",
      "id_TypeCenterServices":"${id_TypeCenterServices}",
      "id_role":"${id_role}"
    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    return response.fold((l) => l, (r) => r);
  }

  reject_join(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.reject_join_request,
        {
          "id":"${id.toString()}"
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
