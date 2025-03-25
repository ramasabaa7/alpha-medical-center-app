
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud_put {
  Future<Either<StatusRequest, Map>> postdata(String url,
      Map<String, dynamic> data, Map<String, String> header) async {
    //  try{
    if (await checkinternet()) {
      var response = await http.put(Uri.parse(url),
          body: data,headers: header);

      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        print("enter to 200");
        return Right(responsebody);
      }
      else if (response.statusCode == 422) {
        print("enter to 422");
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
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
