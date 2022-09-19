import 'package:get_storage/get_storage.dart';

const String CACHE_USER = 'user';
const String CACHE_TOKEN = 'token';
const String CHECK_LOGIN = "loginState";

class Api2{
  final storage = GetStorage();

  //set get user
  Future setUser({dynamic user}) async {
    user ??= "";
    await storage.write(CACHE_USER, user);
  }
  Future<dynamic> getUser() async {
    return storage.read(CACHE_USER);
  }

  //set get token
  Future setToken({String? token}) async {
    token ??= "";
    await storage.write(CACHE_TOKEN, token);
  }
  Future<String?> getToken() async {
    return storage.read(CACHE_TOKEN);
  }

  //set get status login
  Future setIsLogin({bool? isLogin}) async {
    isLogin ??= false;
    await storage.write(CHECK_LOGIN, isLogin);
  }
  Future<bool?> getLoginStatus() async {
    return storage.read(CHECK_LOGIN);
  }


  Future removeStorageForLogout() async {
    await storage.remove(CACHE_USER);
    await storage.remove(CACHE_TOKEN);
    await storage.remove(CHECK_LOGIN);
  }


}