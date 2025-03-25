import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class EditVisitNurseServices{
  String bearer = "Bearer";
  Crud_put crud;
  EditVisitNurseServices(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_visit(int id,int idpatientrecord,String title,String referringphysician )async{
    String? token = await secury.read("nurse_token");
    var response=await crud.postdata(Serverconfig.update_visit,{
      "id" :id.toString(),
      "IDPatientRecord" : idpatientrecord.toString(),
      "Title" : title.toString(),
      "ReferringPhysician" :referringphysician.toString() ,
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