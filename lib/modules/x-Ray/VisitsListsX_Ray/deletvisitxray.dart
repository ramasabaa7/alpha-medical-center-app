import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:http/http.dart' as http;
import 'package:project_after_update/core/class/crud_delete.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class deletexray {
  Crud_delete crud;

  Secury_storage secury = new Secury_storage();
  deletexray (this.crud);
  String? token ;
  deletexraybyid(int id)async{

    String? token = await secury.read("xray_token");
    var response=await crud.postdata(Serverconfig.deletexray,

        {
          "id" :"${id}",
        },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }

}