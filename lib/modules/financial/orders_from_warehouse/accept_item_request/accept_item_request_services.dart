import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Acceept_item_request_services {
  String bearer = "Bearer";
  Crud_get crud;
  Acceept_item_request_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_reservation(int item_id,String production,String expiry,created) async {
    String? token = await secury.read("finance_token");
    var response = await crud.postdata(
        Serverconfig.accept_or_reject_item_request+"?itemRequestId=${item_id}&Status=1&ProductionDate=${production}&ExpiryDate=${expiry}&created_at=${created}",

        {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    }
    );
    print("message");
    print(response);
    message=response;
    return response.fold((l) => l, (r) => r);
  }
}
