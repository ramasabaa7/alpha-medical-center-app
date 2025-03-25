import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_preview_result_services{
  String bearer = "Bearer";
  Crud_put crud;
  Edit_preview_result_services(this.crud);
  Secury_storage secury = new Secury_storage();
  edit_result(String Pressure,String Heartbeat,String BodyHeat,String ClinicalStory,String ClinicalExamination,String comments,int id)async{
    //there is String id in parameters
    String? token = await secury.read("ambulance_token");
    print("the id for visit to edit it is ${id}");
    var response=await crud.postdata(Serverconfig.update_preview_reult,{
      "id" :"${id}",
      "Pressure" : Pressure,
      "Heartbeat" : Heartbeat,
      "BodyHeat" :BodyHeat ,
      "ClinicalStory" :ClinicalStory ,
      "ClinicalExamination" :ClinicalExamination ,
      "Comments" : comments
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