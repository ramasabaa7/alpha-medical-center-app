import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class patientlistservice {
  Crud_get crud;

  Secury_storage secury = new Secury_storage();
  patientlistservice (this.crud);
  String? token ;
  get_allwaitrequest(int id_type)async{

    String? token = await secury.read("laboratory_token");
    var response=await crud.postdata('${Serverconfig.getwaitRequest}?types_of_center_services_id=${id_type}' ,
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }

}