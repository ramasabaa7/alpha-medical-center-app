import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';

import '../../../secure_storage/secure_storage.dart';

class addorderserver{
  Crud crud;
  Secury_storage secury = new Secury_storage();
  addorderserver(this.crud);

  addorder()async{
    String? token = await secury.read("laboratory_token");
    var response=await crud.postdata(Serverconfig.Addorder,{
      "Type" :"internal",
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