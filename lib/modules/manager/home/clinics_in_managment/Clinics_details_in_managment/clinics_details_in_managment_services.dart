
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Clinics_details_in_managment_services {
  Crud_delete crud_delete;
  String bearer = "Bearer";
  Crud_get crud;
  Crud_put crud_put;
  Clinics_details_in_managment_services(this.crud,this.crud_delete,this.crud_put);
  Secury_storage secury = new Secury_storage();

  get_all_services_in_type(int id_type) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_services_in_type_center+"?id=${id_type}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  delete_clinics_service(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.delete_services_in_type,
        {
          "id" : "${id}"
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
  change_status(int id_type,int status)async{
    String? token = await secury.read("admin_token");
    var response=await crud_put.postdata(Serverconfig.change_status_type_service,{
      "id" :"${id_type.toString()}",
      "Status":"${status.toString()}",

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
  get_all_doctors(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.getalldoctor_in_type_service+"?id=${id}",

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