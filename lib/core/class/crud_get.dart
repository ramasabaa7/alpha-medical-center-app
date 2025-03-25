import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud_get {
  Future<Either<StatusRequest, Map>> postdata(String url,
       Map<String, String> header) async {
    print("url is      ${url}");
    print("this is map from crud");
    print("this is header from crud");
    print(header);
    //  try{
    if (await checkinternet()) {
      var response = await http.get(Uri.parse(url)
          ,headers: header);

      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        print("enter to 200");
        return Right(responsebody);
      }
      else if (response.statusCode == 422) {
        print("enter to 422");
        // Map responsebody = jsonDecode(response.body);
        // return Right(responsebody);
        return const Left(StatusRequest.failure);
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
