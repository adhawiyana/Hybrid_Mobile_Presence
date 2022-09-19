import 'package:get/get.dart';
import 'package:tester_app/features/absence/api_absence.dart';
import 'package:tester_app/features/absence/controller_absence.dart';
import 'package:tester_app/features/home/api_home.dart';
import 'package:tester_app/features/home/controller_home.dart';
import 'package:tester_app/features/main/controller_main.dart';
import 'package:tester_app/features/profile/api_profile.dart';
import 'package:tester_app/features/profile/controller_profile.dart';
import 'package:tester_app/features/track_record/api_trackrecord.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class BindingMain implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerMain>(() => ControllerMain());
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
    Get.lazyPut<ControllerAbsence>(() => ControllerAbsence(api: ApiAbsence()));
    Get.lazyPut<ControllerTrackrecord>(() => ControllerTrackrecord(api: ApiTrackrecord()));
    Get.lazyPut<ControllerProfile>(() => ControllerProfile(api: ApiProfile()));
  }
}