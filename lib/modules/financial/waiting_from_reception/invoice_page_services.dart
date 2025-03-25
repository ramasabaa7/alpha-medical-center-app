import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Invoice_page_services {
  String bearer = "Bearer";
  Crud_get crud_get;
  Crud_delete crud_delete;
  Crud crud;
  Invoice_page_services(this.crud,this.crud_delete,this.crud_get);
  Secury_storage secury = new Secury_storage();

  get_required_service(int id_visit) async {

    String? token = await secury.read("finance_token");
    print("thhhhhhe tooooken from getinfo controller is ${token}");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_get.postdata(
        Serverconfig.get_patient_service_by_visite_id+"?Visit_ID=${id_visit}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  add_bill(int patient_visit_id, int insurance_company_id,String dis_type,String dis_details) async {
    String? token = await secury.read("finance_token");
    var response = await crud.postdata(Serverconfig.add_bill, {
      "patient_visit_details_id": "${patient_visit_id}",
      "insurance_company_id": "${insurance_company_id}",
      "DiscountType": "${dis_type}",
      "Discount_Details":"${dis_details}"

    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    return response.fold((l) => l, (r) => r);
  }
  get_all_insurance_company() async {
    String? token = await secury.read("finance_token");


    var response = await crud_get.postdata(
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
  delete_service_for_patient(int id) async {
    String? token = await secury.read("finance_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.delete_services_not_complete,
        {
          "requiredPatientServices_id" : "${id}"
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