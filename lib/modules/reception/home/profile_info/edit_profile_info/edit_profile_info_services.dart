import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_profile_info_services{
  String bearer = "Bearer";
  Crud_put crud;
  Secury_storage secury = new Secury_storage();
  Edit_profile_info_services(this.crud);



  edit_profil_info(String username,String password,String name,String surname,String email,String pass_conf)async{
    String? token = await secury.read("receptionist_token");
    var response=await crud.postdata(Serverconfig.edit_profile_info,{
      "name" :name,
      "surname" :surname,
      "username" :username,
      "email" :email,
      "password" : password,
      "password_confirmation":pass_conf


    },
        {
          "Authorization": bearer + " " + token.toString(),
          "Accept" : "application/json"
        }
    );
    print("this is regiser services  respoonse");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}