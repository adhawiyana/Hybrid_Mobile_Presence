import 'package:tester_app/api/api1.dart';

class ApiAbsence{
  
  Future<dynamic> todayPresence (
      var date,
      int id_user
      ) async {
    var r = await Api1().apiJSONGetWitToken("detailrec/$date/$id_user");
    return r;
  }
}