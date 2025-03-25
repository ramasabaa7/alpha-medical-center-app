import 'package:project_after_update/config/server_config.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class ProdactService {
  Crud_get crud;

  Secury_storage secury = new Secury_storage();
  ProdactService (this.crud);
  String? token ;
  get_allMatirial()async{

    String? token = await secury.read("laboratory_token");
    var response=await crud.postdata(Serverconfig.getmatirial,
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }

}