import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:project_after_update/config/server_config.dart';
import 'package:project_after_update/core/class/Crud.dart';
import 'package:project_after_update/core/class/crud_put.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/crud_get.dart';
import '../../../secure_storage/secure_storage.dart';


class Doctor_home_services {
  Crud_get crud;
  Crud_put crud_Change;
  Crud_put crud_com;
  Crud crud_salary;
  Crud_get crud_my_user;
  Crud_get crud_logout;

  Secury_storage secury = new Secury_storage();
  Doctor_home_services (this.crud,this.crud_Change,this.crud_salary,this.crud_my_user,this.crud_logout,this.crud_com);
  String? token ;
  get_allwaitingPatient(int id_types_of_center_services)async{

    String? token = await secury.read("doctor_token");
    var response=await crud.postdata(Serverconfig.get_All_Wait_Request_ByType_Center_Services+'?types_of_center_services_id=${id_types_of_center_services}',
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }
  changstatuslabbyidservice( int status) async {
    //print(id);
    print(status);
    String? token = await secury.read("doctor_token");
    var response = await crud_Change.postdata(Serverconfig.changeStatus,
        {"id": "${2}",
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
  complete( int ID ) async {
    String? token = await secury.read("doctor_token");
    var response = await crud_com.postdata(Serverconfig.completeRequiredPatientServices,
        {"RequiredPatientID": "${ID}",
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
    String? token = await secury.read("doctor_token");
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

  get_my_user_info()async{

    String? token = await secury.read("doctor_token");
    var response=await crud_my_user.postdata(Serverconfig.get_MyUser_Info,
        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );

    return response.fold((l) => l, (r) => r);
  }
  logout() async {
    String? token = await secury.read("doctor_token");

    // final Map<String, dynamic> data = {};
    // data['Key']="ID Personal";
    // data['Value']="02545164598162";

    var response = await crud_logout.postdata(
        Serverconfig.logout,

        {
          "Authorization": "Bearer" + " " + token.toString(),
          "Accept": "application/json"
        }
    );
    print("response from get all section services");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

}