import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../secure_storage/secure_storage.dart';

class addItemservic{
  Crud crud;
  Secury_storage secury = new Secury_storage();
  addItemservic(this.crud);

  addorder(int id_order,int id_material,String name, String quntity)async{
    String? token = await secury.read("xray_token");
    var response=await crud.postdata(Serverconfig.Additem,{
      'ID_ImportOrderAndConsumable': '${id_order}',
      'ID_CenterMaterial': '${id_material}',
      'Name': '${name}',
      'Quantity': '${quntity}'
    },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("this is login services  respoonse ${response}");
    return response.fold((l) => l, (r) => r);
  }
}