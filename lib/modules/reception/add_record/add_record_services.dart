import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Patient_Regesteration_services {
  String bearer = "Bearer";
  Crud crud;
  Patient_Regesteration_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_patient_record(String idpersonal, String fullname, String age,
      String phonenumber, String addres, String ambulancecase) async {
    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(Serverconfig.patient_regestration, {
      "IDPersonal": idpersonal.toString(),
      "FullName": fullname.toString(),
      "age": age.toString(),
      "phonenumber": phonenumber.toString(),
      "address": addres.toString(),
      "ambulancecases": ambulancecase.toString()
    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("message");
    print(response);
    message=response;
    return response.fold((l) => l, (r) => r);
  }
}
