import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:http/http.dart' as http;
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class changstatuslab {
  Crud_put crud;

  Secury_storage secury = new Secury_storage();

  changstatuslab(this.crud);

  String? token;

  changstatuslabbyidservice( int status) async {
    //print(id);
    print(status);
    String? token = await secury.read("nurse_token");
    var response = await crud.postdata(Serverconfig.changeStatus,
        {"id": "${2}",
          'Status': '${status}',
        },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}