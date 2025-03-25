import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Secury_storage{


  final storage= new FlutterSecureStorage();

  Future<void> save(String key,String value)async{
    await storage.write(key: key, value: value);
  }

  Future<String?> read (String key)async{
    return await storage.read(key: key);
  }
  Future<Void?> delete ()async{
     await storage.deleteAll();
  }
}