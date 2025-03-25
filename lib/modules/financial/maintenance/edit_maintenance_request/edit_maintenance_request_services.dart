import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class update_maintenance_request_services {
  String bearer = "Bearer";
  Crud_put crud_put;
  Crud_get crud_get;
  update_maintenance_request_services(this.crud_put,this.crud_get);
  Secury_storage secury = new Secury_storage();
  late var message;
  update_maintenance_request(int id,int ID_User,String Name,String price,String Details) async {
    String? token = await secury.read("finance_token");
    var response = await crud_put.postdata(Serverconfig.update_maintenance_request, {
      "id":"${id.toString()}",
      "ID_User":"${ID_User.toString()}",
      "Name" : "${Name}",
      "price" : "${price}",
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
  get_my_user_info() async {
    String? token = await secury.read("finance_token");

    var response = await crud_get.postdata(
        Serverconfig.get_myuser_info,

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