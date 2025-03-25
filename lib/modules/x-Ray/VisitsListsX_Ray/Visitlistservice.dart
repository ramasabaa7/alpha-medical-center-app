import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:http/http.dart' as http;
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class Visitlestservice {
  Crud_get crud;

  Secury_storage secury = new Secury_storage();
  Visitlestservice (this.crud);
  String? token ;
  get_allvisitXray(int id)async{

    String? token = await secury.read("xray_token");
    var response=await crud.postdata(Serverconfig.gitvisitsbyid+'${id}',
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }
 Future<String?> download_XRay(int id)async{

    String? token = await secury.read("admin_token");
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