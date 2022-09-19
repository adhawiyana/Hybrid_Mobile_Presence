import 'package:get/get.dart';
import 'package:tester_app/features/splash_screen/controller_splash.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerBind extends Bindings{
  @override
  void dependencies() {
    Get.put(ControllerSplash());
    Get.put(ControllerGlobalUser());
  }

}