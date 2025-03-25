import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_x_ray_type_services {
  String bearer = "Bearer";
  Crud crud;

  Add_x_ray_type_services(this.crud);
  Secury_storage secury = new Secury_storage();
  late var message;
  add_type_xray(int id_section,String name) async {
    String? token = await secury.read("admin_token");
    var response = await crud.postdata(Serverconfig.add_type_center_services, {
      "id_section":"${id_section}",
      "Name": name.toString(),
      "Status":'1'
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