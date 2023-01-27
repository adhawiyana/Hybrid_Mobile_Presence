import 'dart:developer';

import 'package:tester_app/api/api1.dart';

class ApiTrackrecord {
  Future<dynamic> trackRecord ({
    required int id_user,
    required var date_one,
    required var date_two
  })async{
    var r = await Api1().apiJSONGetWitToken('trackrecord/${id_user}/${date_one}/${date_two}');
    log(r.toString());
    return r;
  }

  Future<dynamic> detailTrack ({
    required var date,
    required int id_user
  }) async {
    var r = await Api1().apiJSONGetWitToken("detailrec/$date/$id_user");
    return r;
  }
}