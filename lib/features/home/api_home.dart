import 'package:tester_app/api/api1.dart';

class ApiHome{
  Future<dynamic> getLocation()async{
    var r = await Api1().apiJSONGetWitToken('getlocation/1');
    return r;
  }

  Future<dynamic> presence(
      String post,
      String date,
      String arrivetime,
      String leavingtime,
      double latitude,
      double longitude,
      String location,
      int id_user
      )async{
    final input = {
      "post" : post,
      "date" : date,
      "arrivetime" : arrivetime,
      "leavingtime" : leavingtime,
      "latitude" : latitude,
      "longitude" : longitude,
      "location" : location,
      "id_user" : id_user,
    };

    var r = await Api1().apiJSONPostWithToken("presence", input);
    return r;
  }
}