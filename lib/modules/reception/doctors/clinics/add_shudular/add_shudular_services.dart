// import 'package:project_after_update/config/server_config.dart';
// import 'package:project_after_update/config/user_information.dart';
// import 'package:project_after_update/core/class/Crud.dart';
// import 'package:project_after_update/secure_storage/secure_storage.dart';
//
// class Add_shudular_services {
//   String bearer = "Bearer";
//   Crud crud;
//   Add_shudular_services(this.crud);
//   Secury_storage secury = new Secury_storage();
//   late var message;
//   add_schedular(int user_id,String day,String start,String end) async {
//     String? token = await secury.read("receptionist_token");
//     var response = await crud.postdata(Serverconfig.add_scheduler,
//         {
//           "UserID":"${user_id}",
//           "working":[
//             {
//               "day":"${day}",
//               "times":[
//                 {
//                   "StartTime":"${start}",
//                   "EndTime":"${end}"
//                 },
//               ]
//             },
//           ]
//     }
//         {
//       "Authorization": bearer + " " + token.toString(),
//       "Accept": "application/json"
//     });
//     print("message");
//     print(response);
//     message=response;
//     return response.fold((l) => l, (r) => r);
//   }
// }
