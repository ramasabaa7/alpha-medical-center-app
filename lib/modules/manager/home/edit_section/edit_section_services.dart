import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_section_services{
  String bearer = "Bearer";
  Crud_put crud;
  Edit_section_services(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_section(int id,String name)async{
    String? token = await secury.read("admin_token");
    var response=await crud.postdata(Serverconfig.update_section,{
      "id" :"${id.toString()}",
      "Name" : name.toString(),
      "isReceptionist":"0"
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