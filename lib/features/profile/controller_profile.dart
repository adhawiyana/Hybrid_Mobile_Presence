import 'package:get/get.dart';
import 'package:tester_app/features/profile/api_profile.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerProfile extends GetxController{
  final ApiProfile api;
  ControllerProfile({required this.api});

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();
}