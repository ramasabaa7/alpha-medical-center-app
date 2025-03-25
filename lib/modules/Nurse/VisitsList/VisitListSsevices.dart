
import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class VisitListSsevices{

  String bearer = "Bearer";
  Crud_get crud;
  Crud_get crud2;
  VisitListSsevices(this.crud,this.crud2);
  Secury_storage secury = new Secury_storage();

  get_patient_visits(int id) async {
    String? token = await secury.read("nurse_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_patient_visits + "?IDPatientRecord=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_patient_info(int id) async {
    String? token = await secury.read("nurse_token");


    var response = await crud2.postdata(
        Serverconfig.get_Patient_Information_ByID + "?id=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  Future<String?> download_XRay(int id)async{

    String? token = await secury.read("nurse_token");
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Accept": "application/json"
    };
    var response = await http.get(Uri.parse('https://ultimatebyteos.com/api/downloadX_Rays?id=${id}'),headers: headers);

    final bytes = response.bodyBytes;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/img.png');
    print(file.path);
    await file.writeAsBytes(bytes);
    final prama = SaveFileDialogParams(sourceFilePath: file.path);
    final path = await FlutterFileDialog.saveFile(params: prama);

    return path;

}

}