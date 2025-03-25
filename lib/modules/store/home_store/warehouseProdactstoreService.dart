import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class warehouseProdactstorService {
  Crud_get crud;
  Crud crud_salary;
  Crud_get crud_logout;
  Secury_storage secury = new Secury_storage();
  warehouseProdactstorService (this.crud,this.crud_logout,this.crud_salary);
  String? token ;
  get_allMatirial()async{

    String? token = await secury.read("Store_token");
    var response=await crud.postdata(Serverconfig.getmatirial,
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }
  increment_requrst_Salary(String Details)async{
    //there is String id in parameters
    String? token = await secury.read("Store_token");
    //  String? token = "15|nHiUHfUWloXkp1CC2ZcoVK5dhSg7dZ0tyMMIfiqp";

    var response=await crud_salary.postdata(Serverconfig.add_Salary_Increase,{
      "Details" :Details,

    },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("this is response edit_services  ");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  logout() async {
    String? token = await secury.read("Store_token");

    var response = await crud_logout.postdata(
        Serverconfig.logout,

        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

}