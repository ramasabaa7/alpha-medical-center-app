import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_payments_maintenance_services {
  String bearer = "Bearer";
  Crud crud;
  Add_payments_maintenance_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  Add_payment_maintenance_request(int maintenanceRequests_id,String Name,String Price,String Details) async {
    String? token = await secury.read("finance_token");
    var response = await crud.postdata(Serverconfig.add_payments_maintenance_req, {
      "maintenanceRequests_id":"${maintenanceRequests_id.toString()}",
      "Name" : "${Name}",
      "Price" : "${Price}",
      "Details" : "${Details}",
    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("message");
    print(response);
    message=response;
    return response.fold((l) => l, (r) => r);
  }

}