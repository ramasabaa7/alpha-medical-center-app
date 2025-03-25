import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_receipts_services {
  String bearer = "Bearer";
  Crud crud;
  Add_receipts_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_receipts(int ID_Bill, String price, String Details) async {

    String? token = await secury.read("finance_token");
    var response = await crud.postdata(Serverconfig.add_receipts, {
      "ID_Bill": "${ID_Bill.toString()}",
      "price": "${price.toString()}",
      "Details": "${Details.toString()}"

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