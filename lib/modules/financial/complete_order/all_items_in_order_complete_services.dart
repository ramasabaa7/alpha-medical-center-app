import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class All_item_in_order_complete_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  All_item_in_order_complete_services(this.crud, this.crud_put);
  Secury_storage secury = new Secury_storage();


  get_all_item_in_order_complete(int order_id) async {
    String? token = await secury.read("finance_token");

    var response = await crud.postdata(
        Serverconfig.get_all_item_in_order_complete+"?Order_id=${order_id}", {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }


}
