import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tester_app/shared/helper/utils.dart';

class LocalNotificationService {

  static final FlutterLocalNotificationsPlugin _notificationPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
        "@mipmap/ic_launcher");

    // =======================
    // TODO ADD IOS CONFIG HERE
    // =======================

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await _notificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        log(payload.toString());
        try {
          var res = json.decode(payload.toString());
          handleNotificationRoute(
              res['screen'],
              int.parse(res['id']),
              secondId: res['idPackage'] != null
                  ? int.parse(res['idPackage'])
                  : null
          );
        } catch (e) {
          log(e.toString());
        }
      },
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails = await _notificationPlugin
        .getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      var selectedNotificationPayload = notificationAppLaunchDetails!
          .notificationResponse;
      log("From local notif : $selectedNotificationPayload");
    }
  }

  static void displayNotification(RemoteMessage message) async {
    try {
      final id = DateTime
          .now()
          .millisecondsSinceEpoch ~/ 1000;
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'lugo',
        'lugo',
        channelDescription: 'lugo',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
      await _notificationPlugin.show(
        id,
        message.notification?.title,
        message.notification?.body,
        platformChannelSpecifics,
        payload: json.encode(message.data),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}