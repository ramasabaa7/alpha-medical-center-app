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


class deletematirial {
  Crud_delete crud;

  Secury_storage secury = new Secury_storage();
  deletematirial (this.crud);
  String? token ;
  deletemariralabyid(int id)async{
 print('ddddddddddddddddddddddddddddddddddd');
    String? token = await secury.read("admin_token");
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Accept": "application/json"
    };
    var request = http.MultipartRequest('DELETE', Uri.parse('https://ultimatebyteos.com/api/deleteItemsRequestDateExpired?ItmeRequest_id=${id}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.snackbar(
        "تم",
        "تم حذف العناصر",
      );
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }}

}