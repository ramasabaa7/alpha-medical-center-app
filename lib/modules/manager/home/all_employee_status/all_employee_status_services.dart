
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class all_employee_manager_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  all_employee_manager_services(this.crud,this.crud_put);
  Secury_storage secury = new Secury_storage();

  get_all_user_status() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_user_status,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  change_status(int user_id,int Status)async{
    String? token = await secury.read("admin_token");
    var response=await crud_put.postdata(Serverconfig.update_user_staus,{
      "user_id" :"${user_id.toString()}",
      "Status":"${Status.toString()}",

    },
        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("this is response edit_services  ");
    print(response);
    return response.fold((l) => l, (r) => r);
  }




}
