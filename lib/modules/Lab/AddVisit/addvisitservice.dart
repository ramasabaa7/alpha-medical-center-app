import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../secure_storage/secure_storage.dart';

class addvisitlab{
  Crud crud;
  Secury_storage secury = new Secury_storage();
  addvisitlab(this.crud);

  uploadtest(String Details,int patient,int requiredPatientServices_id,int Status)async{
    String? token = await secury.read("laboratory_token");
    var response=await crud.postdata(Serverconfig.addlabtest,{
      "Details" :"${Details}",
      "patientVisitDetails_id" : "${patient}",
      "requiredPatientServices_id" : "${requiredPatientServices_id}",
      "Status" : "${Status}"
    },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("this is login services  respoonse ${response}");
    return response.fold((l) => l, (r) => r);
  }
}