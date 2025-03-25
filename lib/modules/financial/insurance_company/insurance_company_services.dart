
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Insurance_company_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_delete crud_delete;

  Insurance_company_services(this.crud,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_all_insurance_company() async {
    String? token = await secury.read("finance_token");


    var response = await crud.postdata(
        Serverconfig.get_all_insurance_company,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  delete_type(int company_id) async {
    String? token = await secury.read("finance_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.remove_insurance_compnay,
        {
          "company_id" : "${company_id}"
        },

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

}
