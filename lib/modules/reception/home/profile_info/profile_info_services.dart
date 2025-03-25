
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Profile_info_services {
  String bearer = "Bearer";
  Crud_get crud;
  Profile_info_services(this.crud);
  Secury_storage secury = new Secury_storage();

  get_user_info() async {

    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(
        Serverconfig.get_user_info,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }



}