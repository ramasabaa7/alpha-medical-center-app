
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_get.dart';
import 'package:project_after_update/core/class/crud_put.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class homeNurseServices{
  String bearer = "Bearer";
  Crud_get crud;
  Crud_get crud_get_UserInfoByID;
  Crud_get crud_get_allwaitingPatient;
  Crud_get crud_get_nurses_follower;
  Crud_get crud_get_name_of_service;
  Crud_put crud_change;
  Crud crud_salary;
  Crud_get crud_logout;
  Crud_get crud_my_user;
  homeNurseServices(this.crud,this.crud_get_nurses_follower,this.crud_get_UserInfoByID,this.crud_get_allwaitingPatient,this.crud_get_name_of_service,this.crud_change, this.crud_salary,this.crud_logout,this.crud_my_user);
  Secury_storage secury = new Secury_storage();

  get_patient_details(id_patient) async {

    String? token = await secury.read("nurse_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud.postdata(
        Serverconfig.get_patient_info+"?Key=ID Personal&Value=${id_patient}",

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from patient services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_nurses_follower() async {
    String? token = await secury.read("nurse_token");


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
    String? token = await secury.read("nurse_token");
    print("${id}");
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

  get_allwaitingPatient(int id_types_of_center_services)async{

    String? token = await secury.read("nurse_token");
    var response=await crud_get_allwaitingPatient.postdata(Serverconfig.get_All_Wait_Request_ByType_Center_Services+'?types_of_center_services_id=${id_types_of_center_services}',
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }
  get_name_of_service(int id_types_of_center_services)async{

    String? token = await secury.read("nurse_token");
    var response=await crud_get_allwaitingPatient.postdata(Serverconfig.get_Type_Center_Services+'?id=${id_types_of_center_services}',
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }







  changstatuslabbyidservice(int status)async{
   // print(id);
    print(status);
    String? token = await secury.read("nurse_token");
    var response=await crud_change.postdata(Serverconfig.changeStatus,
        {"id" :"${2}",
          'Status': '${status}',
        },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print(response);
    return response.fold((l) => l, (r) => r);
  }


  increment_requrst_Salary(String Details)async{
    //there is String id in parameters
    String? token = await secury.read("nurse_token");
    //  String? token = "15|nHiUHfUWloXkp1CC2ZcoVK5dhSg7dZ0tyMMIfiqp";

    var response=await crud_salary.postdata(Serverconfig.add_Salary_Increase,{
      "Details" :Details,

    },
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("this is response edit_services  ");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  logout() async {
    String? token = await secury.read("nurse_token");

    var response = await crud_logout.postdata(
        Serverconfig.logout,

        {
          "Authorization": bearer + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
  get_my_user_info()async{

    String? token = await secury.read("nurse_token");
    var response=await crud_my_user.postdata(Serverconfig.get_MyUser_Info,
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }

}