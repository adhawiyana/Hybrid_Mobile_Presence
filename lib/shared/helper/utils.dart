import 'dart:developer';
import 'package:get/get.dart';
import '../../pages/app_routes.dart';

handleNotificationRoute(String screen, int? id, {int? secondId}) {
  log("disini $screen");
  switch (screen) {
  // Travel Screen
    case 'detail_travel':
      Get.toNamed(Routes.home, arguments: id);
      break;
    default:
  }
}