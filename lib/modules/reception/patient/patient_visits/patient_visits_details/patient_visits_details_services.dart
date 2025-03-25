
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/function/checkinternet.dart';
class Patient_visits_details_services {
  String bearer = "Bearer";
  Crud_get crud;
  Patient_visits_details_services(this.crud);
  Secury_storage secury = new Secury_storage();
late var finalpath;
  get_patient_visits_details(int id) async {
    String? token = await secury.read("receptionist_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_patient_visits_details + "?id=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  Future<String?>download_xray(int id) async {
     String? token = await secury.read("receptionist_token");
    var headers = {
      'Authorization': bearer + " " + token.toString(),
      'Accept': 'application/json',

    };
    var response = await http.get( Uri.parse('https://ultimatebyteos.com/api/downloadX_Rays?id=${id}')
        ,headers: headers);
    print("theeee response of file is ${response.bodyBytes}");
   final bytes = response.bodyBytes;
   final dir = await getTemporaryDirectory();
   final file = File('${dir.path}/image.png');
   await file.writeAsBytes(bytes);
   final params = SaveFileDialogParams(sourceFilePath: file.path);
    finalpath= await FlutterFileDialog.saveFile(params: params);
   return finalpath;
  }
}
