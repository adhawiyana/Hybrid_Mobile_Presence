import 'package:get/get.dart';
import 'package:tester_app/features/login/api_login.dart';
import 'package:tester_app/features/login/controller_login.dart';

class BindingLogin implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerLogin>(() => ControllerLogin(api: ApiLogin()));
  }
}