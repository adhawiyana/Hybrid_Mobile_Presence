import 'package:tester_app/api/api1.dart';

class ApiProfile {

  Future<dynamic> onsiteTrack ({
    required int id_user
  })async{
    var r = await Api1().apiJSONGetWitToken("getlengthtrackrec/$id_user/On-site");
    return r;
  }

  Future<dynamic> offsiteTrack ({
    required int id_user
  })async{
    var r = await Api1().apiJSONGetWitToken("getlengthtrackrec/$id_user/Off-site");
    return r;
  }

}