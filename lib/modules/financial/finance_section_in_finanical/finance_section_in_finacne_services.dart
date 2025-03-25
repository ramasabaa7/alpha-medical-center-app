
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Finance_section_in_finance_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  Finance_section_in_finance_services(this.crud,this.crud_put);
  Secury_storage secury = new Secury_storage();

  get_all_user(int section_id) async {
    String? token = await secury.read("finance_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_user_in_section+"?section_id=${section_id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  edit_salary(int id,String salary,)async{
    String? token = await secury.read("finance_token");
    var response=await crud_put.postdata(Serverconfig.change_salary_user,{
      "id" :"${id.toString()}",
      "salary":"${salary.toString()}",

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
