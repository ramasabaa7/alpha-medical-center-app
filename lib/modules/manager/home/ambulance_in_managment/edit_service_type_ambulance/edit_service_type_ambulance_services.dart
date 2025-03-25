import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_service_type_ambulance_services{
  String bearer = "Bearer";
  Crud_put crud;
  Edit_service_type_ambulance_services(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_type(int id,int id_section,String name)async{
    String? token = await secury.read("admin_token");
    var response=await crud.postdata(Serverconfig.update_type_center_services,{
      "id" :"${id.toString()}",
      "id_section":"${id_section}",
      "Name" : name.toString(),
      "Status":"1"
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
}