import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_result_services{
  String bearer = "Bearer";
  Crud_put crud;
  Add_result_services(this.crud);
  Secury_storage secury = new Secury_storage();
  add_resault(String Pressure,String Heartbeat,String BodyHeat,String ClinicalStory,String ClinicalExamination,int id)async{
    //there is String id in parameters
    String? token = await secury.read("ambulance_token");
    var response=await crud.postdata(Serverconfig.add_preview_resault,{
      "id" :"${id}",
      "Pressure" : Pressure,
      "Heartbeat" : Heartbeat,
      "BodyHeat" :BodyHeat ,
      "ClinicalStory" :ClinicalStory ,
      "ClinicalExamination" :ClinicalExamination ,
    },
        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("this is login services  respoonse");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}