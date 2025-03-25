import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class Complete_order_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  Complete_order_services(this.crud, this.crud_put);
  Secury_storage secury = new Secury_storage();

  get_all_order_complete() async {
    String? token = await secury.read("finance_token");

    var response = await crud.postdata(
        Serverconfig.get_all_order_complete, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

// update_material_price(
//     int id, String price) async {
//   String? token = await secury.read("finance_token");
//   var response = await crud_put.postdata(Serverconfig.change_material_price, {
//     "id": "${id.toString()}",
//     "Price": "${price.toString()}",
//   }, {
//     "Authorization": bearer + " " + token.toString(),
//     "Accept": "application/json"
//   });
//   print("message");
//   print(response);
//   return response.fold((l) => l, (r) => r);
// }
}
