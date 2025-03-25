

import 'dart:typed_data';


import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

class Nurse_visit_ditailsServices {
  String bearer = "Bearer";
  Crud_get crud;
  Crud_get crud_down;
  Crud_delete crud_delete;
  String finalpath='';

  Nurse_visit_ditailsServices(this.crud,this.crud_delete,this.crud_down);
  Secury_storage secury = new Secury_storage();

  get_patient_visits_details(int id) async {
    String? token = await secury.read("admin_token");

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
  ///////////////////////////////////////////////////////////////
  delete_patient_visits_details(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_delete.postdata(
        Serverconfig.delete_preview_reult,
        {
          "id" : "${id}"
        },

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient_visits services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }



  Future<Uint8List?> downloadX_Rays(int id) async {
    String? token = await secury.read("admin_token");
    var headers = {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    };

    try {
      var response = await http.get(
        Uri.parse('https://ultimatebyteos.com/api/downloadX_Rays?id=$id'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        print('Failed to download image. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error while downloading image: $e');
      return null;
    }
  }

}
