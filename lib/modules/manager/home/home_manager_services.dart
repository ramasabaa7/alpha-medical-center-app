
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/crud_delete.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

class Home_manager_services {
  Crud_delete crud_delete;
  String bearer = "Bearer";
  Crud_get crud;

  Home_manager_services(this.crud,this.crud_delete);
  Secury_storage secury = new Secury_storage();

  get_all_section() async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_all_section_in_manager,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  Future<String>delete_section(int id) async {
    String? token = await secury.read("admin_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";


      if (await checkinternet()) {
        var response = await http.delete(Uri.parse(Serverconfig.delete_section),
            body:   {
              "id" : "${id}"
            },
            headers:  {
              "Authorization": bearer + " " + token.toString(),
              "Accept": "application/json"
            });

        if (response.statusCode == 200) {
          print("200 and ${response.body}");
          return response.body;
        }
        else if (response.statusCode == 422) {
          return "حدث خطا في السيرفر";
        }
        else {
          return "لم تتم عملية الحذف";
        }
      } else {
        return "هنالك مشكلة في الإتصال بالأنترنت";
      }

  }

}