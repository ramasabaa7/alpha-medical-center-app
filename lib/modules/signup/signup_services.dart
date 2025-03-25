import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class register_services{
  String bearer = "Bearer";
  Crud crud;
  Crud_get crud_get;
  Secury_storage secury = new Secury_storage();
  register_services(this.crud,this.crud_get);


  get_all_type_services_in_center() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_get.postdata(
        Serverconfig.get_all_type_services_in_center,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from register get all section");
    print(response);
    return response.fold((l) => l, (r) => r);
  }


  register(String username,String password,String name,String surname,String conf_pass,String email,String type,int id_TypeCenterServices)async{
    print("the id section is ${id_TypeCenterServices}");
    var response=await crud.postdata(Serverconfig.register,{
      "name" :name,
      "surname" :surname,
      "username" :username,
      "email" :email,
      "password" : password,
      "password_confirmation" :conf_pass,
      "type" :type,
      "id_TypeCenterServices":"${id_TypeCenterServices.toString()}",


    },
        {
          "Accept" : "application/json"
        }
    );
    print("this is regiser services  respoonse");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}