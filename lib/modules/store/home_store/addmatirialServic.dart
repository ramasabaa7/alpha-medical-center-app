import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../secure_storage/secure_storage.dart';

class Addmatirialservic{
  Crud crud;
  Addmatirialservic(this.crud);
  Secury_storage secury = new Secury_storage();
  AddMatirial(String name,String status, String quantity , String lower,String upper, String production,String Expiry)async{
    String? token = await secury.read("Store_token");
    var response=await crud.postdata(Serverconfig.Addmatirial,{
      'Name': '${name}',
      'Status': '1',
      'Quantity': '${quantity}',
      'Lower_Limit': '${lower}',
      'UpperLimit': '300',
      'ProductionDate': '${production}',
      'ExpiryDate': '${Expiry}'
    },
        {
          "Accept" : "application/json",
          "Authorization": "Bearer" + " " + token.toString(),
        }
    );
   print(response);
    return response.fold((l) => l, (r) => r);
  }
}