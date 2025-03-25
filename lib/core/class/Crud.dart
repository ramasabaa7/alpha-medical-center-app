import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postdata(String url,
      Map<String, dynamic> data, Map<String, String> header) async {

    print(data);
    print("this is header from crud");
    print(header);
    //  try{
    if (await checkinternet()) {
      var response = await http.post(Uri.parse(url),
          body: data,headers: header);

      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        print("enter to 200");
        print(responsebody);
        return Right(responsebody);
      }
      else if (response.statusCode == 422) {
        print("enter to 422");
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      }   else if (response.statusCode == 403) {
        print("enter to 403");
        Map responsebody = jsonDecode(response.body);
        return Left(StatusRequest.failure);
      }
      else {
        return const Left(StatusRequest.serverexception);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
    // } catch(_){
    //   return const Left(StatusRequest.serverfailure);
    // }
  }
}
