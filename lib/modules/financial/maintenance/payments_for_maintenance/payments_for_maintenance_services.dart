
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class Payments_for_maintenance_services {
  String bearer = "Bearer";
  Crud_get crud_get;
  Crud_delete crud_delete;
  Payments_for_maintenance_services(this.crud_get,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_all_payments_maintenance_request(int maintenance_re_id) async {
    String? token = await secury.read("finance_token");

    var response = await crud_get.postdata(
        Serverconfig.get_all_payments_maintenance+"?maintenanceRequests_id=${maintenance_re_id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  delete_payments(int maintenance_id) async {
    String? token = await secury.read("finance_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.delete_payments,
        {
          "id" : "${maintenance_id}"
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