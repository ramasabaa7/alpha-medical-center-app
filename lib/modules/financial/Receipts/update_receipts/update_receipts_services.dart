import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Update_receipts_services {
  String bearer = "Bearer";
  Crud_put crud_put;
  Update_receipts_services(this.crud_put);
  Secury_storage secury = new Secury_storage();
  late var message;
  update_receipt(int id, String price, String Details,int id_bill) async {

    String? token = await secury.read("finance_token");
    var response = await crud_put.postdata(Serverconfig.update_receipts, {
      "id": "${id.toString()}",
      "price": "${price.toString()}",
      "Details": "${Details.toString()}",
      "ID_Bill":"${id_bill.toString()}"

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