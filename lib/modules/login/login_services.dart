import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

class Login_services{
  Crud crud;
  Login_services(this.crud);

  login(String username,String password)async{
    print("test type from services user name is num ${username.isNum} and password is num ${password.isNum}");
    var response=await crud.postdata(Serverconfig.signin,{
      "username" :"${username}",
      "password" : "${password}"
    },
      {
        "Accept" : "application/json"
      }
    );
    print("this is login services  respoonse ${response}");
    return response.fold((l) => l, (r) => r);
  }
}