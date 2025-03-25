import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_insurance_company_services{
  String bearer = "Bearer";
  Crud_put crud;
  Edit_insurance_company_services(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_insurance_company(int company_id,String Name,String IN,String AMB,String PM,String DV)async{
    String? token = await secury.read("finance_token");
    var response=await crud.postdata(Serverconfig.edit_insurance_company,{
      "company_id" :"${company_id.toString()}",
      "Name":"${Name.toString()}",
      "IN" : "${IN}",
      "AMB":"${AMB}",
      "PM" : "${PM}",
      "DV" : "${DV}",
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