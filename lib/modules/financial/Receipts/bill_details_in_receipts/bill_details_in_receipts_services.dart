
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class bill_details_in_receipts_services {
  String bearer = "Bearer";
  Crud_get crud;

  bill_details_in_receipts_services(this.crud);
  Secury_storage secury = new Secury_storage();

  get_bill_details(int bill_id) async {
    String? token = await secury.read("finance_token");

    var response = await crud.postdata(
        Serverconfig.get_bill_details+"?bill_id=${bill_id}",

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