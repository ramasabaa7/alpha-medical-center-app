import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Details_of_users_ambulance_services {

  String bearer = "Bearer";
  Crud_get crud;

  Details_of_users_ambulance_services(this.crud);
  Secury_storage secury = new Secury_storage();

  get_users_details(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_user_info_by_id+"?id=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get details ");
    print(response);
    return response.fold((l) => l, (r) => r);
  }



}