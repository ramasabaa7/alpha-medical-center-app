import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_reservation_services {
  String bearer = "Bearer";
  Crud crud;
  Add_reservation_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_reservation(String ID_Doctor, String IDPersonal, String BookingDate,) async {
    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(Serverconfig.patient_reservation_registeration, {
      "ID_Doctor": ID_Doctor.toString(),
      "IDPersonal": IDPersonal.toString(),
      "Type": "Preview",
      "BookingDate": BookingDate.toString(),
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
