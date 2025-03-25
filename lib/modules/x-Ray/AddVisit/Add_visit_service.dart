import 'dart:convert';

import 'package:project_after_update/config/server_config.dart';
import 'package:http/http.dart' as http;

import '../../../secure_storage/secure_storage.dart';
class Add_visit_service {
   var message;
   Secury_storage secury = new Secury_storage();

   String? token ;
   Future<bool> upload(path,details,id_visit,id_requerd) async{
     token = await secury.read("xray_token");
     var headers = {
       'Accept': 'application/json',
       "Authorization": "Bearer" + " " + token.toString(),
     };
     var request = http.MultipartRequest('POST', Uri.parse(Serverconfig.upload_Xray));
     request.fields.addAll({
       'ID_PatientVisitDetails': '${id_visit}',
       'Details': '${details}',
       'requiredPatientServices_id': '${id_requerd}'
     });
     request.files.add(await http.MultipartFile.fromPath('IMG', path));
     request.headers.addAll(headers);

     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200) {
       message = "تم إرفاق الصورة";
       print(await response.stream.bytesToString());
     }
     else {
       print(response.reasonPhrase);
     }


     return true;
   }




}