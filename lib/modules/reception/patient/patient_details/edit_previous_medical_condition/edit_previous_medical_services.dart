import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_previous_medical_services{
  String bearer = "Bearer";
  Crud_put crud;
  Edit_previous_medical_services(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_previous_medical(int id,int patientrecord,String DiseaseName,String Details )async{
    String? token = await secury.read("receptionist_token");
    var response=await crud.postdata(Serverconfig.update_pervious_medical_condition,{
      "id" :id.toString(),
      "IDPatientRecord" : patientrecord.toString(),
      "DiseaseName" : DiseaseName.toString(),
      "Details" :Details.toString() ,
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