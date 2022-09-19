import 'package:get/get.dart';
import 'package:tester_app/features/splash_screen/controller_splash.dart';

class BindingSplash implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerSplash>(() => ControllerSplash());
  }
}