import 'package:get/get.dart';
import 'package:tester_app/features/profile/api_profile.dart';
import 'package:tester_app/features/profile/controller_profile.dart';

class BindingProfile implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerProfile>(() => ControllerProfile(api: ApiProfile()));
  }
}