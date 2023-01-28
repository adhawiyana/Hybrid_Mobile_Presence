import 'package:tester_app/api/api1.dart';

class ApiSetpassword{

  Future<dynamic> setPassword ({
    required int id_user,
    required String newPass,
    required String confirmPass,
  })async{
    final input = {
      "id_user" : id_user, 
      "pass_one" : newPass,
      "pass_two" : confirmPass
    };
    
    var r = await Api1().apiJSONPutWithToken("auth/api/v1/updatepass", input);
    return r;
  }
}