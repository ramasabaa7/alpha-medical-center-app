import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_reservation_services {
  String bearer = "Bearer";
  Crud_put crud;
  Edit_reservation_services(this.crud);
  Secury_storage secury = new Secury_storage();

  edit_reservation(int id, String bookingdate_edit,) async {
    String? token = await secury.read("receptionist_token");
    var response = await crud.postdata(Serverconfig.update_patient_reservation, {
      "id": "${id.toString()}",
      "Type": "Preview",
      "BookingDate": "${bookingdate_edit.toString()}",
    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("message");
    print(response);

    return response.fold((l) => l, (r) => r);
  }
}
