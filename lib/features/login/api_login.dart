import 'dart:developer';
import 'package:tester_app/api/api1.dart';

class ApiLogin{

  Future<dynamic> signIn({
    required String username,
    required String password
      }) async{

    final loginInput ={
      "email" : username,
      "password" : password
    };

    var r = await Api1().apiJSONPost("auth/api/v1/login", loginInput);
    return r;
  }
  
}