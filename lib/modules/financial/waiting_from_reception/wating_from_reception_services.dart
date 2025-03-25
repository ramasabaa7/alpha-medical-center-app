import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Wating_from_reception_services {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_delete crud_delete;
  Wating_from_reception_services(this.crud,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_required_service() async {

    String? token = await secury.read("finance_token");
    print("thhhhhhe tooooken from getinfo controller is ${token}");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_patient_services_in_financial,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  // delete_service_for_patient(int id) async {
  //   String? token = await secury.read("receptionist_token");
  //
  //   // final Map<String, dynamic> data = {};
  //   // data['Key']="ID Personal";
  //   // data['Value']="02545164598162";
  //
  //   var response = await crud_delete.postdata(
  //       Serverconfig.delete_service_for_patient,
  //       {
  //         "id" : "${id}"
  //       },
  //
  //       {
  //         "Authorization": bearer + " " + token.toString(),
  //         "Accept": "application/json"
  //       }
  //   );
  //   print("response from patient_visits services");
  //   print(response);
  //   return response.fold((l) => l, (r) => r);
  // }


}