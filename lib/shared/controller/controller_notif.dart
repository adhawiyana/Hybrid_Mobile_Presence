import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tester_app/shared/helper/local_pushnotif.dart';

import '../../pages/app_routes.dart';

class ControllerNotification extends GetxController{
  @override
  void onInit() async {
    super.onInit();
    initNotificationHandler();
  }

  initNotificationHandler() async {
    await FirebaseMessaging.instance.requestPermission();

    var token = await FirebaseMessaging.instance.getToken();
    log('token = $token');

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      log("instance");
    });

    // only work in foreground
    FirebaseMessaging.onMessage.listen((message) {
      log("onMessage");
      LocalNotificationService.displayNotification(message);
    });

    // when the app is in backgroudn but opened
    // User tap notification in tray
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("onMessageOpenedApp");
      try {

        if(message == null) return;
        Get.toNamed(Routes.home);

      } catch (e) {
        log("error $e");
      }
    });
  }

}