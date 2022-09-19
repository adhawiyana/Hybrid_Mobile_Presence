import 'dart:developer';
import 'package:tester_app/api/api1.dart';

class ApiHome{
  Future<dynamic> getLocation()async{
    var r = await Api1().apiJSONGetWitToken('getlocation/1');
    return r;
  }
}