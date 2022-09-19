import 'package:get/get.dart';
import 'package:tester_app/features/login/binding_login.dart';
import 'package:tester_app/features/login/page_login.dart';
import 'package:tester_app/features/main/binding_main.dart';
import 'package:tester_app/features/main/page_main.dart';
import 'package:tester_app/features/set_password/binding_setpassword.dart';
import 'package:tester_app/features/set_password/page_setpassword.dart';
import 'package:tester_app/features/splash_screen/binding_splash.dart';
import 'package:tester_app/features/splash_screen/page_splash.dart';
import 'package:tester_app/features/track_record/binding_trackrecord.dart';
import 'package:tester_app/features/track_record/detail/detail_trackrecord.dart';
import 'package:tester_app/pages/app_routes.dart';

class AppPages{
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const PageSplash(),
      binding: BindingSplash(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const PageLogin(),
      binding: BindingLogin(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const PageMain(),
      binding: BindingMain(),
    ),
    GetPage(
      name: Routes.set_password,
      page: () => const PageSetpassword(),
      binding: BindingSetpassword(),
    ),
    GetPage(
      name: Routes.detail_track_record,
      page: () => const PageDetailtrackrecord(),
      binding: BindingTrackrecord(),
    ),
  ];
}