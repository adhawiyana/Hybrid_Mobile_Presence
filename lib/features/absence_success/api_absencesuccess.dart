import 'package:tester_app/api/api1.dart';

class ApiAbsenceSuccess{
  Future<dynamic> detailTrack ({
    required var date,
    required int id_user
  }) async {
    var r = await Api1().apiJSONGetWitToken("detailrec/$date/$id_user");
    return r;
  }
}