import 'dart:developer';

import 'package:tester_app/api/api1.dart';

class ApiAbsence{
  
  Future<dynamic> todayPresence (
      var date,
      int id_user
      ) async {
    var r = await Api1().apiJSONGetWitToken("detailrec/$date/$id_user");
    return r;
  }

  Future<dynamic> checkOut({
    required String leavingtime,
    required String date,
    required int id_user
  })async{
    final input = {
      "leavingtime" : leavingtime,
      "date" : date,
      "id_user" : id_user
    };

    log(input.toString());

   var r = await Api1().apiJSONPutWithToken("absence", input);
   return r;
  }

  Future<dynamic> editPost({
    required String date,
    required String post,
    required int id_user
  })async{
    final input = {
      "date" : date,
      "post" : post,
      "id_user" : id_user
    };

    var r = await Api1().apiJSONPutWithToken("editact", input);
    return r;
  }
}