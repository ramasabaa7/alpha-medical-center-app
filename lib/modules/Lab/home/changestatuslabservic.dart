import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class changstatuslab {
  Crud_put crud;

  Secury_storage secury = new Secury_storage();
  changstatuslab (this.crud);
  String? token ;
  changstatuslabbyidservice(int id,int status)async{
    print(id);
    print(status);
    String? token = await secury.read("laboratory_token");
    var response=await crud.postdata('https://ultimatebyteos.com/api/changeStatus',

        {
          "id" :"${id}",
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