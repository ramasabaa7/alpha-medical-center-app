import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_laboratory_service_services {
  String bearer = "Bearer";
  Crud crud;

  Add_laboratory_service_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_laboratory_service(int id_type,String name,String details,String status,String price) async {
    String? token = await secury.read("admin_token");
    var response = await crud.postdata(Serverconfig.add_services_in_type_center, {
      "id_TypeCenterServices":"${id_type}",
      "Name": name.toString(),
      "Details":details.toString(),
      "Status":"${status}",
      "Price":"${price}"
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