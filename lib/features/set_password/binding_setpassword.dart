import 'package:get/get.dart';
import 'package:tester_app/features/set_password/api_setpassword.dart';
import 'package:tester_app/features/set_password/controller_setpassword.dart';

class BindingSetpassword implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerSetpassword>(() => ControllerSetpassword(api: ApiSetpassword()));
  }
}