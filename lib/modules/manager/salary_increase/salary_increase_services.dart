
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Salary_increase_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  Crud_delete crud_delete;
  Salary_increase_services(this.crud,this.crud_put,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_all_salary_increase_requist() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_salary_increase_request,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get salary services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }



  accept_salary_increase_request(int id,int user_id,String new_salary) async {

    String? token = await secury.read("admin_token");
    var response = await crud_put.postdata(Serverconfig.accept_salary_increase_request, {
      "id": "${id.toString()}",
      "user_id":"${user_id.toString()}",
      "newSalary":"${new_salary.toString()}"
    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    return response.fold((l) => l, (r) => r);
  }
  //
  reject_salary_increase_request(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.reject_salary_increase_request,
        {
          "id":"${id.toString()}"
        },

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  get_salary(int user_id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_salary+"?user_id=${user_id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get salary services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

}
