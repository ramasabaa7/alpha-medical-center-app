
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Doctor_following_nures_services {
  String bearer = "Bearer";
  Crud_get crud_get_users_byid;
  Crud_get crud_get_nurses_follower;
  Crud_get crud_get_UserInfoByID;
  Crud crud_AddFollower;
  Doctor_following_nures_services(this.crud_get_users_byid,this.crud_AddFollower,this.crud_get_nurses_follower,this.crud_get_UserInfoByID);
  Secury_storage secury = new Secury_storage();

  get_users_byid(id_patient) async {
    String? token = await secury.read("doctor_token");

    var response = await crud_get_users_byid.postdata(
        Serverconfig.get_Users_ByType + '?id_TypeUser=6',

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  late var message;
  AddFollower(int ID_User, int ID_UserFollow, String start ,String end) async {
    String? token = await secury.read("doctor_token");
    var response = await crud_AddFollower.postdata(Serverconfig.add_Follower, {
      "ID_User": "${ID_User}",
      "ID_UserFollow": "${ID_UserFollow}",
      "StartTime": "${start}",
    "EndTime": "${end}"

    }, {
      "Authorization": bearer + " " + token.toString(),
      "Accept": "application/json"
    });
    print("message");
    print(response);
    message=response;
    return response.fold((l) => l, (r) => r);
  }

  get_nurses_follower() async {
    String? token = await secury.read("doctor_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_get_nurses_follower.postdata(
        Serverconfig.get_List_Follower_After_Today,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_UserInfoByID(int id) async {
    String? token = await secury.read("doctor_token");
    print("${id}");
print("gggggggggggggggggggggggg");
    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_get_UserInfoByID.postdata(
        Serverconfig.get_User_Info_By_ID +"?id=${id}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }


}
