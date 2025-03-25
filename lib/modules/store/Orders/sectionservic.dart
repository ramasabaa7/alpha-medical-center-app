import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class sectionservc {
  Crud_get crud;

  Secury_storage secury = new Secury_storage();
  sectionservc (this.crud);
  String? token ;
  get_section()async{

    String? token = await secury.read("Store_token");
    var response=await crud.postdata(Serverconfig.get_all_section,
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }

}