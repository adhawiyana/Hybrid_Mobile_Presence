import 'dart:developer';

import 'package:tester_app/api/api1.dart';

class ApiTrackrecord {
  Future<dynamic> trackRecord ({required int id_user, required var date_one, required var date_two})async{
    var r = await Api1().apiJSONGetWitToken('trackrecord/${id_user}/${date_one}/${date_two}');
    log(r.toString());
    return r;
  }
}