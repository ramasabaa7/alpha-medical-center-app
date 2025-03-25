import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_clinics_service_services{
  String bearer = "Bearer";
  Crud_put crud;
  Edit_clinics_service_services(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_clinic_service(int id ,int id_type,String name,String details,String status,String price) async {
    String? token = await secury.read("admin_token");
    var response = await crud.postdata(Serverconfig.update_services_in_type, {
      "id":"${id}",
      "id_TypeCenterServices":"${id_type}",
      "Name": name.toString(),
      "Details":details.toString(),
      "Status":"${status}",
      "Price":"${price}"
    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }

}