import 'package:get/get.dart';
import 'package:tester_app/pages/app_routes.dart';
import '../../api/api2.dart';

class ControllerSplash extends GetxController{

  @override
  void onInit() async {
    splashAnimation();
    super.onInit();
  }

  splashAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    var statusLogin = await Api2().getLoginStatus();
    if (statusLogin == true) {
      Get.offNamed(Routes.main);
    } else {
      Get.offNamed(Routes.login);
    }
  }

}